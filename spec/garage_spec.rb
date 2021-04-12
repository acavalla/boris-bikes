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
      subject.accept_bike(bike)
      expect(subject.bikes).to include bike
    end

    it 'has a maximum storage which defaults to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'stops accepting bikes when it is full' do
      subject.capacity.times { subject.accept_bike(bike) }
      expect { subject.accept_bike(bike) }.to raise_error 'Sorry, garage full'
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
      subject.accept_bike(bike)
      subject.accept_bike(bike2)
      subject.release_bike
      expect(subject.bikes).not_to include bike2
    end
  end
end
