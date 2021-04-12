# frozen_string_literal: true

require 'van'

describe Van do
  let(:bike) { double 'bike' }
  let(:bike2) { double 'bike' }
  describe '.initialize' do
    it 'initializes with an empty array of bikes' do
      expect(subject.bikes).to be_empty
    end
  end

  describe '.accept_bikes' do
    it 'stores bikes in bikes array' do
      subject.accept_bikes([bike, bike2])
      expect(subject.bikes).to include bike, bike2
    end

    it 'has a maximum storage which defaults to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'stops accepting bikes when it is full' do
      subject.capacity.times { subject.accept_bikes([bike]) }
      puts subject.bikes.length
      puts subject.bikes.length == subject.capacity
      expect { subject.accept_bikes([bike]) }.to raise_error 'Sorry, van full'
    end
  end

  describe '.release_bikes' do
    it 'removes bikes from bikes array' do
      subject.accept_bikes([bike, bike2])
      subject.release_bikes
      expect(subject.bikes).not_to include bike, bike2
    end
  end
end
