# frozen_string_literal: true

require 'strings/extensions'

using Strings::Extensions

RSpec.describe Strings::Extensions do
  let(:text) { "the madness of men" }

  it "aligns a line in the center" do
    expect(text.align(22, direction: :center)).to eq("  the madness of men  ")
  end

  it "aligns a line to the left" do
    expect(text.align_left(22)).to eq("the madness of men    ")
  end

  it "aligns a line to the right" do
    expect(text.align_right(22)).to eq("    the madness of men")
  end

  it "checks for ansi" do
    expect("\e[33mfoo\e[0m".ansi?).to eq(true)
  end

  it "removes ansi codes" do
    expect("\e[33mfoo\e[0m".sanitize).to eq('foo')
  end

  it "folds a line" do
    expect("foo\n\nbar\n".fold).to eq('foo bar ')
  end

  it "pads a line" do
    expect(text.pad(1)).to eq([
      " " * (text.size + 2),
      " #{text} ",
      " " * (text.size + 2),
    ].join("\n"))
  end

  it "truncates a line" do
    text = "the madness of men"
    expect(text.truncate(10)).to eq('the madn…')
  end

  it "wraps a line" do
    expect('foobar1'.wrap(3)).to eq("foo\nbar\n1")
  end
end

