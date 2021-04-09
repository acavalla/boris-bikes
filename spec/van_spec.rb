require 'van'

describe Van do
  describe '.accept_bikes' do
    let(:bike) {double 'bike'}
    let(:bike2) {double 'bike'}
    it 'initializes with an array of bikes' do
      subject.accept_bikes([bike, bike2])
      expect(subject.bikes).to include bike, bike2
    end
  end
end
