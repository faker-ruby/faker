# frozen_string_literal: true

RSpec.describe Strings::Align, '#align_left' do
  it "aligns line to left" do
    text = "the madness of men"
    expect(Strings::Align.align_left(text, 22)).to eq("the madness of men    ")
  end

  it "fills empty" do
    expect(Strings::Align.align_left('', 22)).to eq("                      ")
  end

  it "left justifies string with unicode characters" do
    text = "こんにちは"
    expect(Strings::Align.align(text, 20, direction: :left)).to eq("こんにちは          ")
  end

  it "left justifies string with ansi codes" do
    text = "\e[32mthe madness of men\e[0m"
    expect(Strings::Align.align(text, 22, direction: :left)).to eq("\e[32mthe madness of men\e[0m    ")
  end

  it "aligns multiline text to left" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    expect(Strings::Align.align_left(text, 40)).to eq([
     "for there is no folly of the beast      \n",
     "of the earth which                      \n",
     "is not infinitely                       \n",
     "outdone by the madness of men           "
    ].join)
  end

  it "left justifies multiline utf text" do
    text = "ラドクリフ\n、マラソン五輪\n代表に1万m出\n場にも含み"
    expect(Strings::Align.align_left(text, 20)).to eq([
      "ラドクリフ          \n",
      "、マラソン五輪      \n",
      "代表に1万m出        \n",
      "場にも含み          "
    ].join)
  end

  it "left justifies ansi text" do
    text = "for \e[35mthere\e[0m is no folly of the beast\nof the \e[33mearth\e0m which\nis \e[34mnot infinitely\e[0m\n\e[33moutdone\e[0m by the madness of men"
    expect(Strings::Align.align_left(text, 40)).to eq([
     "for \e[35mthere\e[0m is no folly of the beast      \n",
     "of the \e[33mearth\e0m which                      \n",
     "is \e[34mnot infinitely\e[0m                       \n",
     "\e[33moutdone\e[0m by the madness of men           "
    ].join)
  end

  it "left justifies multiline text with fill of '*'" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    expect(Strings::Align.align_left(text, 40, fill: '*')).to eq([
     "for there is no folly of the beast******\n",
     "of the earth which**********************\n",
     "is not infinitely***********************\n",
     "outdone by the madness of men***********"
    ].join)
  end
end
