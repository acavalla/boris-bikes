# frozen_string_literal: true

require 'van'

describe Van do
  it_behaves_like BikeContainer
  let(:bike) { double 'bike' }
  let(:garage) { double 'garage', bikes: [bike, bike], is_a?: Garage }

  describe "methods not in bikecontainer" do
    describe '.load' do
      it 'uses alias load for add_bike' do
        expect(subject).to receive(:add_bike)
        subject.load(bike)
      end

      it 'can pickup an array of bikes' do
        expect(garage).to receive(:van_pickup).twice
        subject.pickup(garage)
        expect(subject).not_to be_empty
      end
    end

    describe 'unload' do
      it 'uses alias unload for remove_bike' do
        expect(subject).to receive(:remove_bike)
        subject.unload
      end

      it 'can unload an array of bikes' do
        allow(garage).to receive(:van_pickup)
        subject.pickup(garage)
        expect(garage).to receive(:van_dropoff)
        subject.dropoff(garage)
        expect(subject).to be_empty
      end
    end    
  end
end
