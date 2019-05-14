# frozen_string_literal: true

RSpec.describe Strings::ANSI, '#only_ansi?' do
  it "doesn't report empty string as having ansi codes" do
    expect(Strings::ANSI.only_ansi?('')).to eq(false)
  end

  it "doesn't report string without ansi" do
    expect(Strings::ANSI.only_ansi?("foo")).to eq(false)
  end

  it "doesn't report string containing ansi codes" do
    expect(Strings::ANSI.only_ansi?("\e[33;44mfoo\e[0m")).to eq(false)
  end

  it "reports string with only ansi codes correctly" do
    expect(Strings::ANSI.only_ansi?("\e[33;44m\e[0m")).to eq(true)
  end
end
