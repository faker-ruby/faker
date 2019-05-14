# frozen_string_literal: true

require 'strings/ansi/extensions'

using Strings::ANSI::Extensions

RSpec.describe Strings::ANSI::Extensions do
  it "checks for presence of ansi codes" do
    expect("\e[33mfoo\e[0m".ansi?).to eq(true)
  end

  it "checks if string contains only ansi codes" do
    expect("\e[33mfoo\e[0m".ansi?).to eq(true)
  end

  it "strips ansi codes" do
    expect("\e[33mfoo\e[0m".sanitize).to eq('foo')
  end
end
