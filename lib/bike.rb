class Bike
  attr_reader :working
  def initialize
    @working = true
  end

  def broken
    @working = false
    return true
  end

  def working?
    working
  end
end
