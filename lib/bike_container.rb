module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def remove_bike(bike = bikes.last)
    raise "#{self.class.name} empty" if empty?
    self.bikes.delete bike
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  def working_bikes
    bikes.select(&:working?)
  end

  private
  attr_reader :bikes
end
