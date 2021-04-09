require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike, working?: true  }
  let(:bike2) { double :bike, working?: false }
  let(:van) { double :van }
  let(:van_class) { double :van_class,  new: van }
  let(:subject) { DockingStation.new(van_class: van_class) }
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
  end

  describe '.bike_pickup' do
    it 'instantiates a van and moves the broken bikes into it' do
      subject.dock(bike2)
      allow(van_class).to receive(:new).and_return van
      allow(van).to receive(:accept_bikes)
      subject.bike_pickup
      expect(subject.bikes).not_to include bike2
    end
  end

  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
