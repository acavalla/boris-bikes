require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working) }
  it 'is working, predicately' do
    expect(subject).to be_working
  end

  it 'can be switched to not working' do
    subject.broken
    expect(subject).not_to be_working
  end

  it 'can be fixed' do
    subject.broken
    subject.fix
    expect(subject).to be_working
  end
end
