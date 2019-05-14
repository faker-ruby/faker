require 'spec_helper'
require 'rainbow/ext/string'

RSpec.describe 'String mixin' do
  before do
    Rainbow.enabled = true
  end

  it 'proxies foreground to Rainbow().foreground' do
    expect('hello'.foreground(:red)).to eq(Rainbow('hello').foreground(:red))
  end

  it 'proxies color to Rainbow().color' do
    expect('hello'.color(:red)).to eq(Rainbow('hello').color(:red))
  end

  it 'proxies x11 color to Rainbow().color' do
    expect('hello'.color(:midnightblue)).to eq(Rainbow('hello').color(:midnightblue))
  end

  it 'proxies colour to Rainbow().colour' do
    expect('hello'.colour(:red)).to eq(Rainbow('hello').colour(:red))
  end

  it 'proxies background to Rainbow().background' do
    expect('hello'.background(:red)).to eq(Rainbow('hello').background(:red))
  end

  it 'proxies bright to Rainbow().bright' do
    expect('hello'.bright).to eq(Rainbow('hello').bright)
  end

  it 'proxies faint to Rainbow().faint' do
    expect('hello'.faint).to eq(Rainbow('hello').faint)
  end

  it 'proxies italic to Rainbow().italic' do
    expect('hello'.italic).to eq(Rainbow('hello').italic)
  end

  it 'proxies underline to Rainbow().underline' do
    expect('hello'.underline).to eq(Rainbow('hello').underline)
  end

  it 'proxies blink to Rainbow().blink' do
    expect('hello'.blink).to eq(Rainbow('hello').blink)
  end

  it 'proxies inverse to Rainbow().inverse' do
    expect('hello'.inverse).to eq(Rainbow('hello').inverse)
  end

  it 'proxies hide to Rainbow().hide' do
    expect('hello'.hide).to eq(Rainbow('hello').hide)
  end

  it 'proxies reset to Rainbow().reset' do
    expect('hello'.reset).to eq(Rainbow('hello').reset)
  end

  context "when Rainbow is disabled" do
    before do
      Rainbow.enabled = false
    end

    it "allows chaining but doesn't wrap with escape codes" do
      result = 'hello'
               .foreground(:red)
               .bright
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
