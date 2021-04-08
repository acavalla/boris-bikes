require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike, working?: true  }
  let(:bike2) { double :bike, working?: false }

  describe '.release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'should release a working bike' do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'should not create infinite bikes' do
      expect{ subject.release_bike }.to raise_error "Sorry, no bikes"
    end

    it 'should release a previously docked bike' do
      subject.dock(bike)
      bike = subject.release_bike
      expect(subject.bikes).not_to include bike
    end

    it 'should not release a broken bike' do
      subject.dock(bike)
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#bikes' do
    it 'starts at 0 before any bikes are docked' do
      expect(subject.bikes).to eq []
    end
  end

  describe '.dock' do
    it { is_expected.to respond_to(:dock).with(1).arguments }

    it 'stores docked bikes in the @bikes array' do
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end

    it 'has a maximum storage which defaults to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'stops accepting bikes when it is full' do
      subject.capacity.times {subject.dock(bike)}
      expect{ subject.dock(bike) }.to raise_error "Sorry, station full"
    end

    context 'returning a broken bike' do
      it 'checks working status and adds to array if broken' do
        subject.dock(bike)
        subject.dock(bike2)
        expect(subject.broken_bikes).not_to include bike
        expect(subject.broken_bikes).to include bike2
      end
    end

    describe '.bike_pickup' do
      it 'instantiates a van and moves the broken_bikes into it' do
        subject.dock(bike2)
        subject.bike_pickup
        expect(subject.broken_bikes).not_to include bike2
      end
    end
  end
  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
