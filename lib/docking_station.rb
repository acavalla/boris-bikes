class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bikes << bike
  end

  def contents
    @bikes
  end
end

class Bike
  def working?
    true
  end
end
