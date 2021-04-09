# frozen_string_literal: true

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def accept_bikes(bikes)
    @bikes += bikes
  end

  def release_bikes(bikes)
    @bikes -= bikes
  end
end
