require 'van'

describe Van do
  let(:bike) {double 'bike'}
  let(:bike2) {double 'bike'}
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
  end

  describe '.release_bikes' do
    it 'removes bikes from bikes array' do
      subject.release_bikes([bike, bike2])
      expect(subject.bikes).not_to include bike, bike2
    end
  end

end
