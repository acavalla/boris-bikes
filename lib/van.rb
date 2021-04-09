# frozen_string_literal: true

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def accept_bikes(bikes)
    @bikes += bikes
  end

  def release_bikes
    fixed_bikes = @bikes
    @bikes = []
    fixed_bikes
  end
end
