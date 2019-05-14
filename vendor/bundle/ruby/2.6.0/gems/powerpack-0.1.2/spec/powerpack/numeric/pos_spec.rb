require 'spec_helper'

describe 'Numeric#pos?' do
  it 'returns true for positive integer' do
    expect(1.pos?).to be_truthy
  end

  it 'returns true for positive float' do
    expect(0.1.pos?).to be_truthy
  end

  it 'returns false for negative integer' do
    expect(-1.pos?).to be_falsey
  end

  it 'returns false for negative float' do
    expect(-0.01.pos?).to be_falsey
  end

  it 'returns false for 0' do
    expect(0.pos?).to be_falsey
    expect(0.0.pos?).to be_falsey
  end
end
