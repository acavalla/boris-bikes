# frozen_string_literal: true

class Van
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def accept_bikes(new_bikes)
    raise  'Sorry, van full' if full?
    @bikes += new_bikes
  end

  def release_bikes
    arrived_bikes = @bikes
    @bikes = []
    arrived_bikes
  end

  private
  def full?
    @bikes.length == capacity
  end
end
