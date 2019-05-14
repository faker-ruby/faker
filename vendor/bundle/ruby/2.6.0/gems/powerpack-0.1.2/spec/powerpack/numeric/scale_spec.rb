require 'spec_helper'

describe 'Numeric#hundred' do
  it 'returns positive integer for positive integer' do
    expect(1.hundred).to eql 100
  end

  it 'returns positive float for positive float' do
    expect(0.1.hundred).to eql 10.0
  end

  it 'returns false for negative integer' do
    expect(-1.hundred).to eql -100
  end

  it 'returns false for negative float' do
    expect(-0.1.hundred).to eql -10.0
  end

  it 'returns 0 for 0' do
    expect(0.hundred).to eql 0
    expect(0.0.hundred).to eql 0.0
  end
end

describe 'Numeric#thousand' do
  it 'returns positive integer for positive integer' do
    expect(1.thousand).to eql 1000
  end

  it 'returns positive float for positive float' do
    expect(0.1.thousand).to eql 100.0
  end

  it 'returns false for negative integer' do
    expect(-1.thousand).to eql -1000
  end

  it 'returns false for negative float' do
    expect(-0.1.thousand).to eql -100.0
  end

  it 'returns 0 for 0' do
    expect(0.thousand).to eql 0
    expect(0.0.thousand).to eql 0.0
  end
end

describe 'Numeric#million' do
  it 'returns positive integer for positive integer' do
    expect(1.million).to eql 1000000
  end

  it 'returns positive float for positive float' do
    expect(0.1.million).to eql 100000.0
  end

  it 'returns false for negative integer' do
    expect(-1.million).to eql -1000000
  end

  it 'returns false for negative float' do
    expect(-0.1.million).to eql -100000.0
  end

  it 'returns 0 for 0' do
    expect(0.million).to eql 0
    expect(0.0.million).to eql 0.0
  end
end

describe 'Numeric#billion' do
  it 'returns positive integer for positive integer' do
    expect(1.billion).to eql 1000000000
  end

  it 'returns positive float for positive float' do
    expect(0.1.billion).to eql 100000000.0
  end

  it 'returns false for negative integer' do
    expect(-1.billion).to eql -1000000000
  end

  it 'returns false for negative float' do
    expect(-0.1.billion).to eql -100000000.0
  end

  it 'returns 0 for 0' do
    expect(0.billion).to eql 0
    expect(0.0.billion).to eql 0.0
  end
end

describe 'Numeric#trillion' do
  it 'returns positive integer for positive integer' do
    expect(1.trillion).to eql 1000000000000
  end

  it 'returns positive float for positive float' do
    expect(0.1.trillion).to eql 100000000000.0
  end

  it 'returns false for negative integer' do
    expect(-1.trillion).to eql -1000000000000
  end

  it 'returns false for negative float' do
    expect(-0.1.trillion).to eql -100000000000.0
  end

  it 'returns 0 for 0' do
    expect(0.trillion).to eql 0
    expect(0.0.trillion).to eql 0.0
  end
end

describe 'Numeric#quadrillion' do
  it 'returns positive integer for positive integer' do
    expect(1.quadrillion).to eql 1000000000000000
  end

  it 'returns positive float for positive float' do
    expect(0.1.quadrillion).to eql 100000000000000.0
  end

  it 'returns false for negative integer' do
    expect(-1.quadrillion).to eql -1000000000000000
  end

  it 'returns false for negative float' do
    expect(-0.1.quadrillion).to eql -100000000000000.0
  end

  it 'returns 0 for 0' do
    expect(0.quadrillion).to eql 0
    expect(0.0.quadrillion).to eql 0.0
  end
end
