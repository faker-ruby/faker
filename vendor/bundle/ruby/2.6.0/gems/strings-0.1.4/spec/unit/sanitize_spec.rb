# frozen_string_literal: true

RSpec.describe Strings, '#sanitize' do
  it "removes ansi codes" do
    expect(Strings.sanitize("\e[33mfoo\e[0m")).to eq('foo')
  end
end
