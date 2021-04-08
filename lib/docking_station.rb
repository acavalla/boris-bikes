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
    raise "Sorry, no working bikes" if no_working_bikes?
    working_bikes = bikes - broken_bikes
    bike = working_bikes[-1]
    bikes.delete(bike)
    bike
  end

  def dock(bike)
    raise "Sorry, station full" if full?
    broken_bikes << bike if bike.working? == false
    bikes << bike
  end

  def bike_pickup
    van = Van.new(@broken_bikes)
    @broken_bikes = []
  end


  private
  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length == capacity
  end

  def no_working_bikes?
    (bikes-broken_bikes).length == 0
  end
end
