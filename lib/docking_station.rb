# frozen_string_literal: true

require_relative 'bike'
require_relative 'van'
require_relative 'garage'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    raise 'Sorry, no working bikes' if working_bikes.empty?
    remove_bike working_bikes.pop
  end

  def dock(bike)
    add_bike bike
  end

  def broken_bikes
    bikes.reject(&:working?)
  end

  private

end
