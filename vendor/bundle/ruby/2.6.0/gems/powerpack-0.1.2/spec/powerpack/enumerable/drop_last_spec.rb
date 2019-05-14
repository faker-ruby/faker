require 'spec_helper'

describe 'Enumerable#drop_last' do
  it 'drops the last n elements' do
    expect([1, 2, 3, 4].drop_last(2)).to eq([1, 2])
  end

  it 'returns an empty array if you request to drop too many elems' do
    expect((1..10).drop_last(100)).to eq([])
  end

  it 'does not accept negative argument' do
    expect { [1, 2, 3, 4].drop_last(-1) }.to raise_error(ArgumentError)
  end
end
