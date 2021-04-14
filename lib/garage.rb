# frozen_string_literal: true

require_relative 'bike_container'

class Garage
  include BikeContainer

  def fix_bikes
    bikes.each(&:fix)
  end

  def receive_shipment(van)
    pickup(van)
  end
end
