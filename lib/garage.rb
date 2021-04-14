# frozen_string_literal: true
require_relative 'bike_container'

class Garage
  include BikeContainer

  def fix_bike(bike)
    bike.fix
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
