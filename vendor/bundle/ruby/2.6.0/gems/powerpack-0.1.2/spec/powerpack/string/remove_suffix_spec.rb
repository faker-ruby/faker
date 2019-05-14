require 'spec_helper'

describe 'String#remove_suffix' do
  it 'removes a suffix in a string' do
    expect('Ladies Night'.remove_suffix(' Night')).to eq('Ladies')
  end

  it 'returns the original string if the parameter is not a suffix' do
    expect('Ladies Night'.remove_suffix('Ladies')).to eq('Ladies Night')
  end
end

describe 'String#remove_suffix!' do
  it 'removes a suffix in a string' do
    expect('Ladies Night'.remove_suffix!(' Night')).to eq('Ladies')
  end

  it 'returns the original string if the parameter is not a suffix' do
    expect('Ladies Night'.remove_suffix!('Ladies')).to eq('Ladies Night')
  end
end
