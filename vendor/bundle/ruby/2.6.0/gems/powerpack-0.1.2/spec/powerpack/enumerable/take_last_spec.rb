require 'spec_helper'

describe 'Enumerable#take_last' do
  it 'takes the last n elements' do
    expect([1, 2, 3, 4].take_last(2)).to eq([3, 4])
  end

  it 'returns everything if you request to drop too many elems' do
    expect((1..10).take_last(100)).to eq((1..10).to_a)
  end

  it 'does not accept negative argument' do
    expect { [1, 2, 3, 4].take_last(-1) }.to raise_error(ArgumentError)
  end
end
