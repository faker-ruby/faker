require 'spec_helper'
require 'rainbow'

RSpec.describe 'Custom Rainbow instance' do
  it 'inherits enabled state from the global instance' do
    Rainbow.enabled = :yep
    expect(Rainbow.new.enabled).to eq(:yep)
  end

  it 'tracks its own state separately from the global instance' do
    Rainbow.enabled = :yep
    rainbow = Rainbow.new
    expect(Rainbow.new.enabled).to eq(:yep)

    rainbow.enabled = :nope
    expect(Rainbow.enabled).to eq(:yep)
    expect(rainbow.enabled).to eq(:nope)
  end

  it 'wraps string with escape codes when enabled' do
    rainbow = Rainbow.new
    rainbow.enabled = true

    expect(rainbow.wrap('hello').green).to eq("\e[32mhello\e[0m")
  end

  it "doesn't wrap string with any escape code when disabled" do
    rainbow = Rainbow.new
    rainbow.enabled = false

    expect(rainbow.wrap('hello').green).to eq('hello')
  end
end
