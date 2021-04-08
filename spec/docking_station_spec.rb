require 'docking_station'

describe DockingStation do
  # let(:bike) {double 'bike'}
  describe '.release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'should release a working bike' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'should not create infinite bikes' do
      expect{ subject.release_bike }.to raise_error "Sorry, no bikes"
    end

    it 'should release a previously docked bike' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(subject.bikes).not_to include bike
    end
  end
  it { is_expected.to respond_to(:dock).with(1).arguments }

  describe '#bikes' do
    it 'starts at 0 before any bikes are docked' do
      expect(subject.bikes).to eq []
    end
  end

  describe '.dock' do
    it 'stores docked bikes in the @bikes array' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end

    it 'has a maximum storage which defaults to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'stops accepting bikes when it is full' do
      bike = Bike.new
      subject.capacity.times {subject.dock(bike)}
      expect{ subject.dock(bike) }.to raise_error "Sorry, station full"
    end
  end
  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
