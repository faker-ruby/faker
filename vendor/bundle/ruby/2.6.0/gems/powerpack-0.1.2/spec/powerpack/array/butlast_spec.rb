require 'spec_helper'

describe 'Array#butlast' do
  it 'returns an array without the last element' do
    expect([1, 2, 3].butlast).to eq([1, 2])
  end

  it 'returns [] for empty lists' do
    expect([].butlast).to be_empty
  end
end
