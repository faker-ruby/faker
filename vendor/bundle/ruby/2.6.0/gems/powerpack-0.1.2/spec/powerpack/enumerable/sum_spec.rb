require 'spec_helper'

unless Enumerable.method_defined? :sum
  describe 'Enumerable#sum' do
    it 'sums up the numbers of an enum' do
      expect((1..3).sum).to eq(6)
    end

    it 'returns zero when invoked on an empty collection' do
      expect([].sum).to be_zero
    end

    it 'returns the initial value when invoked on an empty collection' do
      expect([].sum('')).to be_empty
    end

    it 'prepends the initial value to the sum' do
      expect(['b', 'c'].sum('a')).to eq('abc')
    end

    it 'concatenates strings' do
      expect(['a', 'b', 'c'].sum).to eq('abc')
    end

    it 'concatenates arrays' do
      expect([[1], [2], [3]].sum).to eq([1, 2, 3])
    end
  end
end
