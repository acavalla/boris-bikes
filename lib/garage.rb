class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def fix_bike(bike)
    bike.fix
  end
end
