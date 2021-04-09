require 'van'

describe Van do
  describe '.initialize' do
    let(:bike) {double 'bike'}
    let(:bike2) {double 'bike'}
    it 'initializes with an array of bikes' do
      subject = Van.new([bike, bike2])
      expect(subject.broken_bikes).to include bike, bike2
    end
  end
end
