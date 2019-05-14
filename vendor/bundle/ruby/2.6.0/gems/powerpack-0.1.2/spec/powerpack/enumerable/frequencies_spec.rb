require 'spec_helper'

describe 'Enumerable#frequencies' do
  context 'empty collection' do
    it 'evaluates to an empty hash' do
      expect([].frequencies).to eql({})
    end
  end

  context 'populated collection' do
    it 'counts the number of ocurrences and returns a hash in the form value => count' do
      expect([1, 1, :symbol, 3, 1, :symbol, 'string'].frequencies).to eql(
        1        => 3,
        3        => 1,
        'string' => 1,
        :symbol  => 2
      )
    end
  end
end
