require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :bikes, :capacity, :vans
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, van)
    @bikes = []
    @vans = []
    @capacity = capacity
    @van = van
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
    @vans << create_van
    @vans[-1].accept_bikes(broken_bikes)
    @bikes = working_bikes
  end

  private
  def create_van
    @van.new
  end

  def empty?
    bikes.empty?
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

  def broken_bikes
    bikes.select {|bike| !bike.working?}
  end

  def release_and_return
    bike = working_bikes[-1]
    bikes.delete(bike)
    bike
  end
end
