class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry, no bikes" if bikes.length == 0
    Bike.new
  end

  def dock(bike)
    @bikes << bike
  end
end
