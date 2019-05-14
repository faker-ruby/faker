require 'spec_helper'

describe 'String#format' do
  it 'behaves like String#%' do
    expect('%s %s'.format %w(James Bond)).to eq('%s %s' % %w(James Bond))
  end

  it 'behaves like Kernel#sprintf' do
    expect('%s %s'.format %w(James Bond))
      .to eq(sprintf('%s %s', 'James', 'Bond'))
  end
end
