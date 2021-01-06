require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'Should release a working bike' do
    expect(DockingStation.new.release_bike.working?).to eq true
  end
  it { is_expected.to respond_to(:dock).with(1).arguments }
  station = DockingStation.new
  bike = Bike.new
  it 'Check that our instance variable is 0 before docking any bikes' do
    expect(station.bikes).to eq []
  end
  it 'Check that the instance variable array contains bike we just docked' do
    station.dock(bike)
    expect(station.bikes).to include bike
  end

  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
