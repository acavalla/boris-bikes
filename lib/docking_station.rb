# frozen_string_literal: true

require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :bikes, :capacity, :vans

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, van_class: Van)
    @bikes = []
    @vans = []
    @capacity = capacity
    @van_class = van_class
  end

  def release_bike
    check_availability
    release_and_return
  end

  def dock(bike)
    raise 'Sorry, station full' if full?

    bikes << bike
  end

  def bike_pickup
    add(van_class.new)
    @vans.last.accept_bikes(broken_bikes)
    @bikes = working_bikes
  end

  def bike_dropoff(van)
    van.release_bikes.each { |bike| dock(bike) }
  end

  private

  attr_reader :van_class

  def add(van)
    @vans << van
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.length == capacity
  end

  def no_working_bikes?
    bikes.select(&:working?).empty?
  end

  def check_availability
    raise 'Sorry, no bikes' if empty?
    raise 'Sorry, no working bikes' if no_working_bikes?
  end

  def working_bikes
    bikes.select(&:working?)
  end

  def broken_bikes
    bikes.reject(&:working?)
  end

  def release_and_return
    bike = working_bikes[-1]
    bikes.delete(bike)
    bike
  end
end
