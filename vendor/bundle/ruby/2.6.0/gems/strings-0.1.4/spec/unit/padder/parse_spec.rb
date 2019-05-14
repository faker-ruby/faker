# frozen_string_literal:true

RSpec.describe Strings::Padder, '#parse' do
  it "parses nil" do
    instance = Strings::Padder.parse(nil)
    expect(instance.padding).to eq([])
  end

  it 'parses self' do
    value = Strings::Padder.new([])
    instance = Strings::Padder.parse(value)
    expect(instance.padding).to eq([])
  end

  it "parses digit" do
    instance = Strings::Padder.parse(5)
    expect(instance.padding).to eq([5,5,5,5])
  end

  it "parses 2-element array" do
    instance = Strings::Padder.parse([2,3])
    expect(instance.padding).to eq([2,3,2,3])
  end

  it "parses 4-element array" do
    instance = Strings::Padder.parse([1,2,3,4])
    expect(instance.padding).to eq([1,2,3,4])
  end

  it "fails to parse unknown value" do
    expect {
      Strings::Padder.parse(:unknown)
    }.to raise_error(Strings::Padder::ParseError)
  end
end
