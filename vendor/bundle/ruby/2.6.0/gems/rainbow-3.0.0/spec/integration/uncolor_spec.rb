require 'spec_helper'
require 'rainbow'

RSpec.describe 'uncolor method' do

  it 'strips ansi color escape code' do
    expect(Rainbow.uncolor("\e[35mhello\e[0mm")).to eq 'hellom'
  end

  it 'does not strip scroll down escape code' do
    expect(Rainbow.uncolor("\e[1Thello")).to eq "\e[1Thello"
  end

end
