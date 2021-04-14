# frozen_string_literal: true
require 'spec_helper'
require 'docking_station'
# require 'support/shared_examples_for_bike_container'

describe DockingStation do
  let(:bike) { double :bike, working?: true }
  let(:bike2) { double :bike, working?: false }
  describe '.release_bike' do
    it 'should not release a broken bike' do
      subject.dock(bike)
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike
    end
  end

  it_behaves_like BikeContainer
  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
