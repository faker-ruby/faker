# frozen_string_literal: true

RSpec.describe Strings::Truncate, '#truncate' do
  let(:text) { 'ラドクリフ、マラソン五輪代表に1万m出場にも含み' }

  it "doesn't change text for 0 length" do
    expect(Strings::Truncate.truncate(text, 0)).to eq(text)
  end

  it "doensn't change text for nil length" do
    expect(Strings::Truncate.truncate(text, nil)).to eq(text)
  end

  it "doesn't change text for equal length" do
    truncation = Strings::Truncate.truncate(text, text.length * 2)
    expect(truncation).to eq(text)
  end

  it 'truncates text and displays omission' do
    trailing = '…'
    expect(Strings::Truncate.truncate(text, 12)).to eq("ラドクリフ#{trailing}")
  end

  it "estimates total width correctly " do
    text = '太丸ゴシック体'
    trailing = '…'
    expect(Strings::Truncate.truncate(text, 8)).to eq("太丸ゴ#{trailing}")
  end

  it "doesn't truncate text when length exceeds content" do
    expect(Strings::Truncate.truncate(text, 100)).to eq(text)
  end

  it "doesn't truncate whole words" do
    text = "I know not all that may be coming, but be it what it will, I'll go to it laughing."
    trailing = '…'
    truncation = Strings::Truncate.truncate(text, separator: ' ')
    expect(truncation).to eq("I know not all that may be#{trailing}")
  end

  it 'truncates text with string separator' do
    trailing = '…'
    truncation = Strings::Truncate.truncate(text, 12, separator: '')
    expect(truncation).to eq("ラドクリフ#{trailing}")
  end

  it 'truncates text with regex separator' do
    trailing = '…'
    truncation = Strings::Truncate.truncate(text, 12, separator: /\s/)
    expect(truncation).to eq("ラドクリフ#{trailing}")
  end

  it 'truncates text with custom trailing' do
    trailing = '... (see more)'
    truncation = Strings::Truncate.truncate(text, 20, trailing: trailing)
    expect(truncation).to eq("ラド#{trailing}")
  end

  it 'correctly truncates with ANSI characters' do
    text = "I try \e[34mall things\e[0m, I achieve what I can"
    truncation = Strings::Truncate.truncate(text, 18)
    expect(truncation).to eq("I try \e[34mall things\e[0m…")
  end

  it "finishes on word boundary" do
    text = "for there is no folly of the beast of the earth"
    truncation = Strings::Truncate.truncate(text, 20, separator: ' ')
    expect(truncation).to eq('for there is no…')
  end
end
