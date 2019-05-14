# frozen_string_literal: true

RSpec.describe Strings, '#align' do
  it "aligns text" do
    text = "the madness of men"
    expect(Strings.align(text, 22, direction: :center)).to eq("  the madness of men  ")
  end

  it "aligns text to left" do
    text = "the madness of men"
    expect(Strings.align_left(text, 22)).to eq("the madness of men    ")
  end

  it "aligns text to right" do
    text = "the madness of men"
    expect(Strings.align_right(text, 22)).to eq("    the madness of men")
  end
end
