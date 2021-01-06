require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'Should release a working bike' do
    expect(DockingStation.new.release_bike.working?).to eq true
  end
  it { is_expected.to respond_to(:dock).with(1).arguments }
  before do
    station = DockingStation.new
    bike = Bike.new
  end
  context 'Check that our instance variable is 0 before docking any bikes' do
    expect(station.contents).to eq []
  end
  context 'Check that the instance variable is 1 after docking a bike' do
    station.dock(bike)
    expect(station.contents).to eq [bike]
  end

  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
