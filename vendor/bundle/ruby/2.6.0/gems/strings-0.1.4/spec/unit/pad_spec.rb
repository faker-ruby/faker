# frozen_string_literal: true

RSpec.describe Strings, '#pad' do
  it "pads text" do
    text = 'ラドクリフ、マラソン五輪代表に1万m出場にも含み'
    expect(Strings.pad(text, [1,1,1,1])).to eql([
      '                                                ',
      ' ラドクリフ、マラソン五輪代表に1万m出場にも含み ',
      '                                                '
    ].join("\n"))
  end
end
