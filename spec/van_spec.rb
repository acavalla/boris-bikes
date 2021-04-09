require 'van'

describe Van do
  describe '.accept_bikes' do
    let(:bike) {double 'bike'}
    let(:bike2) {double 'bike'}
    it 'initializes with an empty array of bikes' do
      expect(subject.bikes).to be_empty
    end

    it 'accepts bikes' do
      subject.accept_bikes([bike, bike2])
      expect(subject.bikes).to include bike, bike2
    end

    it 'releases bikes' do
      subject.release_bikes([bike, bike2])
      expect(subject.bikes).not_to include bike, bike2
    end
  end
end
