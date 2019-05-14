require 'spec_helper'
require 'rainbow'

RSpec.describe 'Rainbow() wrapper' do
  before do
    Rainbow.enabled = true
  end

  it 'allows foreground coloring by color number' do
    result = Rainbow('hello').foreground(5)
    expect(result).to eq("\e[35mhello\e[0m")
  end

  it 'allows foreground coloring by color name' do
    result = Rainbow('hello').foreground(:red)
    expect(result).to eq("\e[31mhello\e[0m")
  end

  it 'allows foreground coloring directly by ANSI method name' do
    result = Rainbow('hello').red
    expect(result).to eq("\e[31mhello\e[0m")
  end

  it 'allows foreground coloring directly by X11 method name' do
    result = Rainbow('hello').midnightblue
    expect(result).to eq("\e[38;5;18mhello\e[0m")
  end

  it 'allows foreground coloring by ANSI color name (color alias)' do
    result = Rainbow('hello').color(:red)
    expect(result).to eq("\e[31mhello\e[0m")
  end

  it 'allows foreground coloring by color name (colour alias)' do
    result = Rainbow('hello').colour(:red)
    expect(result).to eq("\e[31mhello\e[0m")
  end

  it 'allows foreground coloring by X11 color name' do
    result = Rainbow('hello').foreground(:midnightblue)
    expect(result).to eq("\e[38;5;18mhello\e[0m")
  end

  it 'allows foreground coloring by color rgb' do
    result = Rainbow('hello').foreground(255, 128, 64)
    expect(result).to eq("\e[38;5;215mhello\e[0m")
  end

  it 'allows foreground coloring by color rgb (hex string)' do
    result = Rainbow('hello').foreground('ff8040')
    expect(result).to eq("\e[38;5;215mhello\e[0m")
  end

  it 'allows background coloring by color number' do
    result = Rainbow('hello').background(3)
    expect(result).to eq("\e[43mhello\e[0m")
  end

  it 'allows background coloring by ANSI color name' do
    result = Rainbow('hello').background(:green)
    expect(result).to eq("\e[42mhello\e[0m")
  end

  it 'allows background coloring by X11 color name' do
    result = Rainbow('hello').background(:midnightblue)
    expect(result).to eq("\e[48;5;18mhello\e[0m")
  end

  it 'allows background coloring by color rgb' do
    result = Rainbow('hello').background(255, 128, 64)
    expect(result).to eq("\e[48;5;215mhello\e[0m")
  end

  it 'allows making text bright' do
    result = Rainbow('hello').bright
    expect(result).to eq("\e[1mhello\e[0m")
  end

  it 'allows making text faint' do
    result = Rainbow('hello').faint
    expect(result).to eq("\e[2mhello\e[0m")
  end

  it 'allows making text italic' do
    result = Rainbow('hello').italic
    expect(result).to eq("\e[3mhello\e[0m")
  end

  it 'allows making text underlined' do
    result = Rainbow('hello').underline
    expect(result).to eq("\e[4mhello\e[0m")
  end

  it 'allows making text blinking' do
    result = Rainbow('hello').blink
    expect(result).to eq("\e[5mhello\e[0m")
  end

  it 'allows making text inversed' do
    result = Rainbow('hello').inverse
    expect(result).to eq("\e[7mhello\e[0m")
  end

  it 'allows making text hidden' do
    result = Rainbow('hello').hide
    expect(result).to eq("\e[8mhello\e[0m")
  end

  it 'allows resetting all the attributes' do
    result = Rainbow('hello').reset
    expect(result).to eq("\e[0mhello\e[0m")
  end

  it 'allows chaining' do
    result = Rainbow('hello')
             .foreground(:red)
             .bright
             .bold
             .faint
             .dark
             .italic
             .background('#ff8040')
             .underline
             .color(:blue)
             .blink
             .inverse
             .hide

    expect(result).to eq(
      "\e[31m\e[1m\e[1m\e[2m\e[2m\e[3m\e[48;5;215m\e[4m\e[34m\e[5m\e[7m\e[8mhello\e[0m"
    )
  end

  context "when Rainbow is disabled" do
    before do
      Rainbow.enabled = false
    end

    it "allows chaining but doesn't wrap with escape codes" do
      result = Rainbow('hello')
               .foreground(:red)
               .bright
               .bold
               .faint
               .dark
               .italic
               .background('#ff8040')
               .underline
               .color(:blue)
               .blink
               .inverse
               .hide

      expect(result).to eq('hello')
    end
  end
end
