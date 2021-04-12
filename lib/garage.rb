# frozen_string_literal: true

class Garage
  include BikeContainer
  attr_reader :bikes, :capacity

  def fix_bike(bike)
    bike.fix
  end
end
