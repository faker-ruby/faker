require 'spec_helper'

describe 'Enumerable#average' do
  it 'calculates the average of an enum' do
    expect((1..3).average).to eq(2)
  end

  it 'calculates the average of an array' do
    expect([1, 2, 3, 4].average).to eq(2.5)
  end

  it 'returns nil when invoked on an empty collection' do
    expect([].average).to be_nil
  end

  it 'returns default value when invoked on an empty collection' do
    expect([].average(0)).to be_zero
  end
end
