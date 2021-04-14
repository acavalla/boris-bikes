# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double 'bike' }
  let(:van) { double 'van', bikes: bike }

  describe '.fix' do
    it 'has a method that calls fix on bikes' do
      expect(bike).to receive(:fix)
      subject.fix_bike(bike)
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
