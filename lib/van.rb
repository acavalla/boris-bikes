# frozen_string_literal: true

class Van
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def accept_bike(bike)
    raise  'Sorry, van full' if full?
    @bikes << bike
  end

  def release_bike
    bike = bikes[-1]
    bikes.delete(bike)
  end

  private
  def full?
    bikes.length == capacity
  end
end
