# frozen_string_literal: true

describe 'Domain' do
  ds = DockingStation.new
  van = Van.new
  bike = Bike.new
  bike2 = Bike.new
  bike3 = Bike.new
  bike.broken
  bike3.broken

  describe '.pickup' do
    it 'only removes broken bikes from docking station' do
      ds.dock(bike)
      ds.dock(bike2)
      ds.dock(bike3)
      van.pickup(ds)
      expect(van).not_to be_empty
      expect(van.working_bikes).to be_empty
      expect(ds.working_bikes).not_to be_empty
    end
  end
end
