# frozen_string_literal: true

RSpec.describe TTY::Pager::BasicPager, '.page' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }

  it "doesn't paginate empty string" do
    pager = described_class.new(output: output, input: input)
    pager.page("")
    expect(output.string).to eq("")
  end

  it "doesn't paginate text that fits on screen" do
    text = "I try all things, I achieve what I can.\n"
    pager = described_class.new(output: output, width: 100, height: 10)
    pager.page(text)
    expect(output.string).to eq(text)
  end

  it "breaks text exceeding terminal width" do
    text = "It is not down on any map; true places never are.\n"
    input << "\n"
    input.rewind
    pager = described_class.new(output: output, input: input,
                                width: 10, height: 6)
    pager.page(text)
    expect(output.string).to eq([
      "It is not ",
      "down on ",
      "any map; ",
      "true ",
      "",
      "--- Page ",
      "-1- Press ",
      "e",
      "nter/retur",
      "n to ",
      "continue ",
      "(or q to ",
      "quit) ---",
      "places ",
      "never are.\n"
    ].join("\n"))
  end

  it "continues paging when enter is pressed" do
    text = []
    10.times { text << "I try all things, I achieve what I can.\n"}
    input << "\n\n\n"
    input.rewind
    pager = described_class.new(output: output, input: input,
                                width: 100, height: 5)
    pager.page(text.join)
    expect(output.string).to eq([
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "",
      "--- Page -1- Press enter/return to continue (or q to quit) ---",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "",
      "--- Page -2- Press enter/return to continue (or q to quit) ---",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "",
      "--- Page -3- Press enter/return to continue (or q to quit) ---",
      "I try all things, I achieve what I can.\n"
    ].join("\n"))
  end

  it "stops paging when q is pressed" do
    text = []
    10.times { text << "I try all things, I achieve what I can.\n"}
    input << "\nq\n"
    input.rewind
    pager = described_class.new(output: output, input: input,
                                width: 100, height: 5)
    pager.page(text.join)
    expect(output.string).to eq([
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "",
      "--- Page -1- Press enter/return to continue (or q to quit) ---",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "",
      "--- Page -2- Press enter/return to continue (or q to quit) ---\n",
    ].join("\n"))
  end

  it "allows to change paging prompt" do
    text = []
    5.times { text << "I try all things, I achieve what I can.\n"}
    input << "\nq\n"
    input.rewind
    prompt = proc { |num| output.puts "Page -#{num}-" }
    pager = described_class.new(output: output, input: input,
                                width: 100, height: 5, prompt: prompt)
    pager.page(text.join)
    expect(output.string).to eq([
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.",
      "Page -1-",
      "I try all things, I achieve what I can.",
      "I try all things, I achieve what I can.\n",
    ].join("\n"))
  end

  it "preserves new lines when breaking" do
    text = "a\na\na\na\na\na\na\na\na\na"
    input << "\n\n\n"
    input.rewind
    pager = described_class.new(output: output, input: input,
                                width: 80, height: 5)
    pager.page(text)
    expect(output.string).to eq([
      "a",
      "a",
      "a",
      "",
      "--- Page -1- Press enter/return to continue (or q to quit) ---",
      "a",
      "a",
      "a",
      "",
      "--- Page -2- Press enter/return to continue (or q to quit) ---",
      "a",
      "a",
      "a",
      "",
      "--- Page -3- Press enter/return to continue (or q to quit) ---",
      "a"
    ].join("\n"))
  end
end
