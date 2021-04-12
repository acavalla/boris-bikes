require 'spec_helper'
require 'support/shared_examples_for_bike_container'

require './lib/docking_station'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end
