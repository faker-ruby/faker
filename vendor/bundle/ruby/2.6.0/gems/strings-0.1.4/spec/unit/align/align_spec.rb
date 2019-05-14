# frozen_string_literal: true

RSpec.describe Strings::Align, '#align' do
  it "doesn't align unrecognized direction" do
    text = "the madness of men"
    expect {
      Strings::Align.align(text, 22, direction: :unknown)
    }.to raise_error(ArgumentError, /Unknown alignment/)
  end

  it "fills empty" do
    expect(Strings::Align.align('', 22, direction: :center)).to eq("                      ")
  end

  it "centers line" do
    text = "the madness of men"
    expect(Strings::Align.align_center(text, 22)).to eq("  the madness of men  ")
  end

  it "centers unicode characters" do
    text = "こんにちは"
    expect(Strings::Align.align_center(text, 20)).to eq("     こんにちは     ")
  end

  it "centers string with ansi codes" do
    text = "\e[32mthe madness of men\e[0m"
    expect(Strings::Align.align_center(text, 22)).to eq("  \e[32mthe madness of men\e[0m  ")
  end

  it "centers multiline text" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    expect(Strings::Align.align_center(text, 40)).to eq([
      "   for there is no folly of the beast   \n",
      "           of the earth which           \n",
      "           is not infinitely            \n",
      "     outdone by the madness of men      "
    ].join)
  end

  it "centers multiline text with exact width" do
    text = "the madness \nof men"
    expect(Strings::Align.align_center(text, 12)).to eq([
      "the madness \n",
      "   of men   "
    ].join)
  end

  it "centers multiline unicode text" do
    text = "ラドクリフ\n、マラソン五輪\n代表に1万m出\n場にも含み"
    expect(Strings::Align.align_center(text, 20)).to eq([
      "     ラドクリフ     \n",
      "   、マラソン五輪   \n",
      "    代表に1万m出    \n",
      "     場にも含み     "
    ].join)
  end

  it "centers text with ansi codes" do
    text = "for \e[35mthere\e[0m is no folly of the beast\nof the \e[33mearth\e0m which\nis \e[34mnot infinitely\e[0m\n\e[33moutdone\e[0m by the madness of men"
    expect(Strings::Align.align_center(text, 40)).to eq([
      "   for \e[35mthere\e[0m is no folly of the beast   \n",
      "           of the \e[33mearth\e0m which           \n",
      "           is \e[34mnot infinitely\e[0m            \n",
      "     \e[33moutdone\e[0m by the madness of men      "
    ].join)
  end

  it "centers multiline text with fill character '*'" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    expect(Strings::Align.align(text, 40, direction: :center, fill: '*')).to eq([
      "***for there is no folly of the beast***\n",
      "***********of the earth which***********\n",
      "***********is not infinitely************\n",
      "*****outdone by the madness of men******"
    ].join)
  end
end
