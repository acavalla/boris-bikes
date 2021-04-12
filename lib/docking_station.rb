# frozen_string_literal: true

require_relative 'bike'
require_relative 'van'
require_relative 'garage'
require_relative 'bike_container'

class DockingStation
  include BikeContainer
  attr_reader :bikes, :capacity, :vans

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, van_class: Van)
    @bikes = []
    @vans = []
    @capacity = capacity
    @van_class = van_class
  end

  def release_bike
    raise 'Sorry, no working bikes' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    add_bike bike
  end

  private

  def working_bikes
    bikes.select(&:working?)
  end
end
