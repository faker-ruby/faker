# encoding: utf-8

RSpec.describe Strings::Wrap, '.wrap' do
  context 'when unicode' do
    let(:text) { 'ラドクリフ、マラソン五輪代表に1万m出場にも含み' }

    it "doesn't wrap at zero length" do
      expect(Strings::Wrap.wrap(text, 0)).to eq(text)
    end

    it "doesn't wrap at nil length" do
      expect(Strings::Wrap.wrap(text, nil)).to eq(text)
    end

    it "doesn't wrap at length exceeding content length" do
      expect(Strings::Wrap.wrap(text, 100)).to eq(text)
    end

    it "wraps correctly unbreakable words" do
      expect(Strings::Wrap.wrap('foobar1', 3)).to eq([
        "foo",
        "bar",
        "1"
      ].join("\n"))
    end

    it "collapses multiple line breaks " do
      text = "some \r\n\n\n\nunbreakable\n\n\n\n  \r\r\rcontent \t"
      expect(Strings::Wrap.wrap(text, 5)).to eq([
        "some ",
        "unbre",
        "akabl",
        "e",
        "  ",
        "conte",
        "nt "
      ].join("\n"))
    end

    it "preserves newlines" do
      text = "It is not down\n on any map;\n true places never are."
      expect(Strings::Wrap.wrap(text, 10)).to eq([
        "It is not ",
        "down",
        " on any ",
        "map;",
        " true ",
        "places ",
        "never are."
      ].join("\n"))
    end

    it "wraps ascii text" do
      text = "for there is no folly of the beast of the earth which is not infinitely outdone by the madness of men "
      expect(Strings::Wrap.wrap(text, 16)).to eq([
        "for there is no ",
        "folly of the ",
        "beast of the ",
        "earth which is ",
        "not infinitely ",
        "outdone by the ",
        "madness of men "
      ].join("\n"))
    end

    it 'wraps at 8 characters' do
      expect(Strings::Wrap.wrap(text, 8)).to eq([
        "ラドクリ",
        "フ、マラ",
        "ソン五輪",
        "代表に1",
        "万m出場",
        "にも含み"
      ].join("\n"))
    end

    it 'preserves whitespace' do
      text = "  As for me,   I am    tormented with   an everlasting   itch for   things remote.  "
      expect(Strings::Wrap.wrap(text, 10)).to eq([
        "  As for ",
        "me,   I ",
        "am    ",
        "tormented ",
        "with   an ",
        "e",
        "verlasting",
        "   itch ",
        "for   ",
        "things ",
        "remote.  "
      ].join("\n"))
    end
  end

  context 'when long text' do
    it "wraps long text at 45 characters" do
      text =
      "What of it, if some old hunks of a sea-captain orders me to get a broom and sweep down the decks? What does that indignity amount to, weighed, I mean, in the scales of the New Testament? Do you think the archangel Gabriel thinks anything the less of me, because I promptly and respectfully obey that old hunks in that particular instance? Who ain't a slave? Tell me that. Well, then, however the old sea-captains may order me about--however they may thump and punch me about, I have the satisfaction of knowing that it is all right;"
      expect(Strings::Wrap.wrap(text, 45)).to eq unindent <<-EOS
    What of it, if some old hunks of a \nsea-captain orders me to get a broom and \n sweep down the decks? What does that \nindignity amount to, weighed, I mean, in the \n scales of the New Testament? Do you think \nthe archangel Gabriel thinks anything the \nless of me, because I promptly and \nrespectfully obey that old hunks in that \nparticular instance? Who ain't a slave? Tell \nme that. Well, then, however the old \nsea-captains may order me about--however \nthey may thump and punch me about, I have \nthe satisfaction of knowing that it is all \nright;
      EOS
    end
  end

  context 'with newlines' do
    it "preserves newlines for both prefix and postfix" do
      text = "\n\nラドクリフ、マラソン五輪代表に1万m出場にも含み\n\n\n"
      expect(Strings::Wrap.wrap(text, 10)).to eq([
        "\nラドクリフ",
        "、マラソン",
        "五輪代表に",
        "1万m出場に",
        "も含み\n"
      ].join("\n"))
    end
  end

  context 'with ANSI codes' do
    it "wraps ANSI chars" do
      text = "\e[32;44mIgnorance is the parent of fear.\e[0m"
      expect(Strings::Wrap.wrap(text, 14)).to eq([
        "\e[32;44mIgnorance is \e[0m",
        "\e[32;44mthe parent of \e[0m",
        "\e[32;44mfear.\e[0m",
      ].join("\n"))
    end

    it "wraps ANSI in the middle of text" do
      text = "Ignorance is the \e[32mparent\e[0m of fear."
      expect(Strings::Wrap.wrap(text, 14)).to eq([
        "Ignorance is ",
        "the \e[32mparent\e[0m of ",
        "fear.",
      ].join("\n"))
    end

    it "wraps multline ANSI codes" do
      text = "\e32;44mMulti\nLine\nContent.\e[0m"
      expect(Strings::Wrap.wrap(text, 14)).to eq([
        "\e32;44mMulti\e[0m",
        "\e32;44mLine\e[0m",
        "\e32;44mContent.\e[0m",
      ].join("\n"))
    end

    it "wraps multiple ANSI codes in a single line" do
      text = "Talk \e[32mnot\e[0m to me of \e[33mblasphemy\e[0m, man; I'd \e[35mstrike the sun\e[0m if it insulted me."
      expect(Strings::Wrap.wrap(text, 30)).to eq([
        "Talk \e[32mnot\e[0m to me of \e[33mblasphemy\e[0m, ",
        "man; I'd \e[35mstrike the sun\e[0m if it ",
        "insulted me."
      ].join("\n"))
    end
  end
end
