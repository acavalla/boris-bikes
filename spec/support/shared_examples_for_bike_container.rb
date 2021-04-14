require './lib/bike_container'

shared_examples_for BikeContainer do
  let(:bike) { double 'bike' }
  let(:garage) { double 'garage', is_a: Garage, bikes: [bike]}

  describe 'capacity' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can be overridden' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.add_bike double :bike
      expect(subject).not_to be_empty
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.add_bike double :bike }
      expect{ subject.add_bike double :bike }.to raise_error "#{described_class.name} full"
    end
  end

  describe 'remove bike' do
    let(:bike) { double 'bike' }
    before(:each) { subject.add_bike bike }

    it 'returns a bike' do
      expect(subject.remove_bike).to eq bike
    end

    it 'removes the bike from the collection' do
      subject.remove_bike
      expect(subject).to be_empty
    end

    it 'raises an error when empty' do
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error "#{described_class.name} empty"
    end
  end

  describe '.pickup' do
    it 'removes an array of bikes from specific venue' do
      allow(garage).to receive(:remove_bike)
      subject.pickup(garage)
    end
  end
end
