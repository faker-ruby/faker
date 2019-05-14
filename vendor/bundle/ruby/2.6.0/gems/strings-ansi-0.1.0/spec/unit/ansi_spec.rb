# frozen_string_literal: true

RSpec.describe Strings::ANSI, '#ansi?' do
  it "does't report empty string" do
    expect(Strings::ANSI.ansi?('')).to eq(false)
  end

  it "reports non-ansi string correctly" do
    expect(Strings::ANSI.ansi?("foo")).to eq(false)
  end

  it "checks if code is ansi" do
    expect(Strings::ANSI.ansi?("\e[33;44mfoo\e[0m")).to eq(true)
  end
end
