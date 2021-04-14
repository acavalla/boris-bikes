# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double 'bike' }
  let(:van) { double 'van' }

  describe '.fix' do
    it 'has a method that calls fix on bikes' do
      subject.add_bike(bike)
      expect(bike).to receive(:fix)
      subject.fix_bikes
    end
  end

  describe '.receive_shipment' do
    it 'is an alias for .pickup' do
      expect(subject).to receive(:pickup)
      subject.receive_shipment(van)
    end
  end

  it_behaves_like BikeContainer
end
