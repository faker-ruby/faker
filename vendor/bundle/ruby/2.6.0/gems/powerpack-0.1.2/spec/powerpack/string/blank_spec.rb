require 'spec_helper'

describe 'String#blank?' do
  it 'returns true for an empty string' do
    expect(''.blank?).to be_truthy
  end

  it 'returns true for a string with only whitespace in it' do
    expect('     '.blank?).to be_truthy
  end

  it 'returns false for a string with non-whitespace chars in it' do
    expect('   test'.blank?).to be_falsey
  end
end
