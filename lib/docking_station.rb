class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry, no bikes" if empty?
    bike = bikes[-1]
    bikes.delete(bike)
    bike
  end

  def dock(bike)
    raise "Sorry, station full" if full?
    @bikes << bike
  end

  private
  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length == 1
  end
end
