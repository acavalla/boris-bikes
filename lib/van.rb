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
    select_bikes(venue).each do | bike |
      load(bike)
      venue.remove_bike bike
    end
  end

  def dropoff(venue)
    bikes.each do | bike |
      unload
      venue.add_bike bike
    end
  end

  private
  def select_bikes(venue)
    venue.is_a?Garage ? bikes = venue.bikes : bikes = venue.broken_bikes
    return bikes
  end
end
