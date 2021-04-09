require 'garage'

describe Garage do
  describe '.fix' do
    let(:bike) { double 'bike' }
    it 'has a method that calls fix on bikes' do
      expect(bike).to receive(:fix)
      subject.fix_bike(bike)
    end
  end
end
