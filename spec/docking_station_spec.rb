require 'docking_station'

describe DockingStation do
  let(:bike) {double 'bike'}
  it { is_expected.to respond_to(:release_bike) }

  it 'Should release a working bike' do
    expect(subject.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).arguments }

  it 'Check that our instance variable is 0 before docking any bikes' do
    expect(subject.bikes).to eq []
  end

  it 'Check that the instance variable array contains bike we just docked' do
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end

  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
