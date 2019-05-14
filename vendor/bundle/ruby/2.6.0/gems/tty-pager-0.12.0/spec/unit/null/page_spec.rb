# frozen_string_literal: true

RSpec.describe TTY::Pager::NullPager, '.page' do
  let(:output)   { StringIO.new }

  it "prints content to stdout when tty device" do
    allow(output).to receive(:tty?).and_return(true)
    pager = described_class.new(output: output)
    text = "I try all things, I achieve what I can.\n"

    pager.page(text)

    expect(output.string).to eq(text)
  end

  it "returns text when non-tty device" do
    pager = described_class.new(output: output)
    text = "I try all things, I achieve what I can.\n"

    expect(pager.page(text)).to eq(text)
    expect(output.string).to eq('')
  end
end
