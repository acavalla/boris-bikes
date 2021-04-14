# frozen_string_literal: true

require 'van'

describe Van do
  it_behaves_like BikeContainer
  let(:bike) { double 'bike' }
  let(:garage) { double 'garage', bikes: [bike, bike] }
  it 'uses alias load for add_bike' do
    expect(subject).to receive(:add_bike)
    subject.load(bike)
  end

  it 'uses alias unload for remove_bike' do
    expect(subject).to receive(:remove_bike)
    subject.unload
  end

  it 'can load an array of bikes' do
    subject.pickup(garage, garage.bikes)
    expect(subject).not_to be_empty
  end
end
