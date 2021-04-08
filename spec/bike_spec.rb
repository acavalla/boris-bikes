require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it 'is working, predicately' do
    expect(subject).to be_working
  end
end
