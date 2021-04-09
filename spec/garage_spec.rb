# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double 'bike' }
  let(:bike2) { double 'bike' }

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

  describe '.fix' do
    it 'has a method that calls fix on bikes' do
      expect(bike).to receive(:fix)
      subject.fix_bike(bike)
    end
  end

  describe '.release_bikes' do
    it 'removes bikes from array' do
      subject.accept_bikes([bike, bike2])
      subject.release_bikes([bike])
      expect(subject.bikes).not_to include bike
    end
  end
end
