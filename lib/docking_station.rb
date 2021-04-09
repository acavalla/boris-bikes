require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :bikes, :capacity, :vans
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @vans = []
    @capacity = capacity
    @van = Van.new
  end

  def release_bike
    check_availability
    release_and_return
  end

  def dock(bike)
    raise "Sorry, station full" if full?
    bikes << bike
  end

  def bike_pickup
    @vans << @van.accept_bikes(bikes.select {|bike| !bike.working?})
    @bikes = bikes.select {|bike| bike.working?}
  end


  private
  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length == capacity
  end

  def no_working_bikes?
    bikes.select {|bike| bike.working?}.empty?
  end

  def broken?(bike)
    bike.working? == false
  end

  def check_availability
    raise "Sorry, no bikes" if empty?
    raise "Sorry, no working bikes" if no_working_bikes?
  end

  def working_bikes
    bikes.select {|bike| bike.working?}
  end

  def release_and_return
    bike = working_bikes[-1]
    bikes.delete(bike)
    bike
  end
end
