# encoding: utf-8

RSpec.describe Strings, '#wrap' do
  it "wraps text" do
    text = 'ラドクリフ、マラソン五輪代表に1万m出場にも含み'
    expect(Strings.wrap(text, 8)).to eql([
      "ラドクリ",
      "フ、マラ",
      "ソン五輪",
      "代表に1",
      "万m出場",
      "にも含み"
    ].join("\n"))
  end
end
