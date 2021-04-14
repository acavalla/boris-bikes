# frozen_string_literal: true
require_relative 'bike_container'
class Van
  include BikeContainer

  def load(bike)
    add_bike(bike)
  end

  def unload
    remove_bike
  end

  def pickup(venue)
    venue.is_a?Garage ? bikes = venue.bikes : bikes = venue.broken_bikes
    bikes.each do | bike |
      load(bike)
      venue.van_pickup bike
    end
  end
end
