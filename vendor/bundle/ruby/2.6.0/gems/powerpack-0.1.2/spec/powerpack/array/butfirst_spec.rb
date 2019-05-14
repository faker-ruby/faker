require 'spec_helper'

describe 'Array#butfirst' do
  it 'returns an array without the first element' do
    expect([1, 2, 3].butfirst).to eq([2, 3])
  end

  it 'returns nil for empty lists' do
    expect([].butfirst).to be_nil
  end
end
