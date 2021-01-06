class DockingStation
  def initialize
    @bike = 0
  end
  def release_bike
    Bike.new
  end

  def dock(bike)

  end
end

class Bike
  def working?
    true
  end
end
