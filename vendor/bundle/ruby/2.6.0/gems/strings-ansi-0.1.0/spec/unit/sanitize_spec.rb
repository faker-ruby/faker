# frozen_string_literal: true

RSpec.describe Strings::ANSI, '#sanitize' do
  {
    "\e[20h" => '',
    "\e[?1h" => '',
    "\e[20l" => '',
    "\e[?9l" => '',
    "\eO"    => '',
    "\e[m"   => '',
    "\e[0m"  => '',
    "\eA"    => '',
    "\e[0;33;49;3;9;4m\e[0m" => ''
  }.each do |code, expected|
    it "remove #{code.inspect} from string" do
      expect(Strings::ANSI.sanitize(code)).to eq(expected)
    end
  end
end
