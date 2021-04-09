class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def accept_bikes(bikes)
    @bikes += bikes
  end

  def fix_bike(bike)
    bike.fix
  end
end
