# frozen_string_literal: true

RSpec.describe TTY::Pager::SystemPager, '#command_exists?' do
  subject(:pager) { described_class }

  it "successfully checks command exists on the system" do
    allow(TTY::Which).to receive(:exist?).with('less').and_return('/usr/bin/less').and_return(true)
    expect(pager.command_exists?('less')).to eq(true)
  end

  it "fails to check command exists on the system" do
    allow(TTY::Which).to receive(:exist?).with('less').and_return(false)
    expect(pager.command_exists?('less')).to eq(false)
  end
end
