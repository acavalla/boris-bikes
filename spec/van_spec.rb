# frozen_string_literal: true

require 'van'

describe Van do
  it_behaves_like BikeContainer
  let(:bike) { double 'bike' }
  let(:garage) { double 'garage', bikes: [bike, bike], is_a: Garage }

  describe 'methods not in bikecontainer' do
    describe '.load' do
      it 'uses alias load for add_bike' do
        expect(subject).to receive(:add_bike)
        subject.load(bike)
      end

      it 'can pickup an array of bikes' do
        allow(garage).to receive(:working_bikes).and_return(garage.bikes)
        expect(garage).to receive(:remove_bike).twice
        subject.pickup(garage)
        expect(subject).not_to be_empty
      end
    end

    describe '.unload' do
      it 'uses alias unload for remove_bike' do
        expect(subject).to receive(:remove_bike)
        subject.unload(bike)
      end
    end
  end
end
