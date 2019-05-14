# unicode: utf-8
# frozen_string_literals: true

RSpec.describe Strings, '#fold' do
  {
    "  \n"      => '  ',
    "\n  "      => '  ',
    "\n"        => ' ',
    "\n\n\n"    => ' ',
    " \n "      => '  ',
    " \n \n \n" => '   '
  }.each do |actual, expected|
    it "removes newline '#{actual.gsub(/\n/, '\\n')}' to '#{expected}'" do
      expect(Strings::Fold.fold(actual)).to eq(expected)
    end
  end

  {
    "  \r\n" => '  ',
    "\r\n  " => '  ',
    "\r\n"   => ' ',
    " \r\n " => '  ',
  }.each do |actual, expected|
    it "squashes '#{actual.gsub(/\r\n/, '\\r\\n')}' to '#{expected}'" do
      expect(Strings::Fold.fold(actual, "\r\n")).to eq(expected)
    end
  end
end
