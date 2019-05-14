# frozen_string_literal: true

RSpec.describe Strings, '#truncate' do
  it "truncates text" do
    text = 'ラドクリフ、マラソン五輪代表に1万m出場にも含み'
    expect(Strings.truncate(text, 12)).to eq('ラドクリフ…')
  end
end
