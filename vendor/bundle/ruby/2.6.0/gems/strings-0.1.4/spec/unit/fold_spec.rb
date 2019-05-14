# fronzen_string_literal: true

RSpec.describe Strings, '#fold' do
  it "folds a multiline text into a single line" do
    expect(Strings.fold("\tfoo \r\n\n\n bar")).to eq(" foo  bar")
  end
end
