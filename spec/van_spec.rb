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

  describe '.accept_bike' do
    it 'stores bikes in bikes array' do
      subject.accept_bike(bike)
      expect(subject.bikes).to include bike
    end

    it 'has a maximum storage which defaults to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'stops accepting bikes when it is full' do
      subject.capacity.times { subject.accept_bike(bike) }
      expect { subject.accept_bike(bike) }.to raise_error 'Sorry, van full'
    end
  end

  describe '.release_bikes' do
    it 'removes bikes from bikes array' do
      subject.accept_bike(bike)
      subject.accept_bike(bike2)
      subject.release_bike
      expect(subject.bikes).not_to include bike2
    end
  end
end
