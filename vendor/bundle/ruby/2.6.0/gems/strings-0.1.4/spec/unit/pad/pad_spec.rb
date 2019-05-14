# frozen_string_literal: true

RSpec.describe Strings::Pad, '#pad' do
  it "pads content with padding as a single value" do
    text = "Ignorance is the parent of fear."
    expect(Strings::Pad.pad(text, 1)).to eq([
      "                                  ",
      " Ignorance is the parent of fear. ",
      "                                  ",
    ].join("\n"))
  end

  it "pads content with specific padding as an array" do
    text = "Ignorance is the parent of fear."
    expect(Strings::Pad.pad(text, [1,1,1,1])).to eq([
      "                                  ",
      " Ignorance is the parent of fear. ",
      "                                  ",
    ].join("\n"))
  end

  it "pads with custom character" do
    text = "Ignorance is the parent of fear."
    expect(Strings::Pad.pad(text, [1, 2], fill: "*")).to eq([
      "************************************",
      "**Ignorance is the parent of fear.**",
      "************************************",
    ].join("\n"))
  end

  it "pads unicode content" do
    text = "ラドクリフ、マラソン"
    expect(Strings::Pad.pad(text, [1,1,1,1])).to eq([
      "                      ",
      " ラドクリフ、マラソン ",
      "                      "
    ].join("\n"))
  end

  it "pads multiline content" do
    text = "It is the easiest thing\nin the world for a man\nto look as if he had \na great secret in him."
    expect(Strings::Pad.pad(text, [1,2])).to eq([
      "                           ",
      "  It is the easiest thing  ",
      "  in the world for a man  ",
      "  to look as if he had   ",
      "  a great secret in him.  ",
      "                           ",
    ].join("\n"))
  end

  it "pads ANSI codes inside content" do
    text = "It is \e[35mthe easiest\e[0m thing\nin the \e[34mworld\e[0m for a man\nto look as if he had \na great \e[33msecret\e[0m in him."
    expect(Strings::Pad.pad(text, [1,1,1,1])).to eq([
      "                         ",
      " It is \e[35mthe easiest\e[0m thing ",
      " in the \e[34mworld\e[0m for a man ",
      " to look as if he had  ",
      " a great \e[33msecret\e[0m in him. ",
      "                         ",
    ].join("\n"))
  end
end
