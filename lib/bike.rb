# frozen_string_literal: true

class Bike
  attr_reader :working

  def initialize
    @working = true
  end

  def broken
    @working = false
    true
  end

  def fix
    @working = true
  end

  def working?
    working
  end
end
