class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry, no bikes" if empty?
    Bike.new
  end

  def dock(bike)
    @bikes << bike
  end

  private
  def empty?
    bikes.length == 0
  end
end
