require 'spec_helper'

describe 'Enumerable#drop_last_while' do
  it 'drops the last elements while a pred is true' do
    expect([1, 2, 3, 4, 6].drop_last_while(&:even?)).to eq([1, 2, 3])
  end
end
