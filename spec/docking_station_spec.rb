# frozen_string_literal: true
require 'spec_helper'
require 'docking_station'
# require 'support/shared_examples_for_bike_container'

describe DockingStation do
  let(:bike) { double :bike, working?: true }
  let(:bike2) { double :bike, working?: false }

  describe "methods not covered by BikeContainer" do
    before do
      subject.dock(bike)
      subject.dock(bike2)
    end

    describe '.release_bike' do
      it 'should not release a broken bike' do
        expect(subject.release_bike).to eq bike
      end
    end

    describe '.pickup' do
      it 'removes all the broken bikes' do
        subject.pickup
        expect(subject.bikes).to eq [bike]
      end
    end
  end


  it_behaves_like BikeContainer
  # it { is_expected.to have_attributes(assigns(:bike) == 0) }
end
