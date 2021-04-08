class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    bikes.length == capacity
  end
end
