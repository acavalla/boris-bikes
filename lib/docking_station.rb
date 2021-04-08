class DockingStation
  attr_reader :bikes, :capacity, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Sorry, no bikes" if empty?
    bike = bikes[-1]
    if bike.working
      bikes.delete(bike)
      bike
    else
      bike = bikes[-2]
      bikes.delete(bike)
      bike
    end
  end

  def dock(bike)
    raise "Sorry, station full" if full?
    broken_bikes << bike if bike.working? == false
    bikes << bike
  end

  private
  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length == capacity
  end
end
