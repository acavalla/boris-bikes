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

  describe '.initialize' do
    it 'initializes with an empty bikes array' do
      expect(subject.bikes).to be_empty
    end
  end

  describe '.accept_bikes' do
    it 'stores bikes' do
      subject.accept_bikes([bike])
      expect(subject.bikes).to include bike
    end
  end
end
