# frozen_string_literal: true
require_relative 'bike_container'
class Van
  include BikeContainer

  def load(bike)
    add_bike(bike)
  end

  def unload(bike)
    remove_bike(bike)
  end

  def pickup(venue)
    select_bikes(venue).each do | bike |
      add_bike(bike)
      venue.remove_bike bike
    end
  end

  private
  def select_bikes(venue)
    venue.is_a?(DockingStation) ? venue.broken_bikes : venue.working_bikes
  end
end
