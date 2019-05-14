require 'spec_helper'

describe 'Enumerable#exactly' do
  context 'with block' do
    it 'returns true for exact number of matches' do
      expect([1, 2, 3, 4].exactly?(2, &:even?)).to be_truthy
    end

    it 'returns false for less matches' do
      expect([1, 3, 4].exactly?(2, &:even?)).to be_falsey
    end

    it 'returns false for more matches' do
      expect([1, 3, 4, 6, 8].exactly?(2, &:even?)).to be_falsey
    end
  end

  context 'without block' do
    it 'returns true for exact number of non nil/false elements in absence of nil/false elements' do
      expect([1, 2, 3, 4].exactly?(4)).to be_truthy
    end

    it 'returns true for exact number of non nil/false elements in presence of nil/false elements' do
      expect([1, 2, nil, false].exactly?(2)).to be_truthy
    end

    it 'returns true for exact number of nil/false elements' do
      expect([nil, false].exactly?(0)).to be_truthy
    end

    it 'returns false if there are less non nil/false elements in absence of nil/false elements' do
      expect([1, 2, 3].exactly?(4)).to be_falsey
    end

    it 'returns false if there are less non nil/false elements in presence of nil/false elements' do
      expect([1, nil, false].exactly?(4)).to be_falsey
    end
  end
end
