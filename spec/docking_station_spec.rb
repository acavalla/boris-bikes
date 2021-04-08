require 'docking_station'

describe DockingStation do
  let(:bike) {double 'bike'}
  it { is_expected.to respond_to(:release_bike) }

  it 'Should release a working bike' do
    expect(subject.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).arguments }

  it 'Check that our instance variable is 0 before docking any bikes' do
<<<<<<< HEAD
    expect(subject.contents).to eq []
=======
    expect(station.bikes).to eq []
>>>>>>> e4ce19cb719ac4f7a6921607fd186a1ec923f676
  end

  it 'Check that the instance variable array contains bike we just docked' do
<<<<<<< HEAD

    subject.dock(bike)
    expect(subject.contents).to include bike
=======
    station.dock(bike)
    expect(station.bikes).to include bike
>>>>>>> e4ce19cb719ac4f7a6921607fd186a1ec923f676
  end

  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
