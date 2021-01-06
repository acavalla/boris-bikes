class DockingStation
  def initialize
    @bike = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike << bike
  end

  def contents
    @bike
  end
end

class Bike
  def working?
    true
  end
end
