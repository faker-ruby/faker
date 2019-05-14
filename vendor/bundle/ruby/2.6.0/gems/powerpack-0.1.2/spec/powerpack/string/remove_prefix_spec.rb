require 'spec_helper'

describe 'String#remove_prefix' do
  it 'removes a prefix in a string' do
    expect('Ladies Night'.remove_prefix('Ladies ')).to eq('Night')
  end

  it 'returns the original string if the parameter is not a prefix' do
    expect('Ladies Night'.remove_prefix('Night')).to eq('Ladies Night')
  end
end

describe 'String#remove_prefix!' do
  it 'removes a prefix in a string' do
    expect('Ladies Night'.remove_prefix!('Ladies ')).to eq('Night')
  end

  it 'returns the original string if the parameter is not a prefix' do
    expect('Ladies Night'.remove_prefix!('Night')).to eq('Ladies Night')
  end
end
