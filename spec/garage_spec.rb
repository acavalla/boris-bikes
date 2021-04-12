# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double 'bike' }

  describe '.fix' do
    it 'has a method that calls fix on bikes' do
      expect(bike).to receive(:fix)
      subject.fix_bike(bike)
    end
  end

  it_behaves_like BikeContainer
end
