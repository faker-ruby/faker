require 'spec_helper'

describe 'String#squish' do
  it 'strips leading and trailing whitespace' do
    expect(' Peter   '.squish).to eq('Peter')
  end

  it 'compacts internal whitespace' do
    expect("Peter\r\n \t   Parker".squish).to eq('Peter Parker')
  end
end

describe 'String#squish!' do
  it 'strips leading and trailing whitespace' do
    expect(' Peter   '.squish!).to eq('Peter')
  end

  it 'compacts internal whitespace' do
    expect("Peter\r\n \t   Parker".squish!).to eq('Peter Parker')
  end
end
