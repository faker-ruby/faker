# frozen_string_literal: true

RSpec.describe TTY::Pager::SystemPager, '#new' do
  it "raises error if system paging is not supported" do
    allow(TTY::Pager::SystemPager).to receive(:find_executable).and_return(nil)

    expect {
      TTY::Pager::SystemPager.new
    }.to raise_error(TTY::Pager::Error, "TTY::Pager::SystemPager cannot be used on your system due to lack of appropriate pager executable. Install `less` like pager or try using `BasicPager` instead.")
  end

  it "accepts multiple commands" do
    allow(TTY::Pager::SystemPager)
      .to receive(:find_executable).and_return('more -r')

    TTY::Pager::SystemPager.new(command: ['less -r', 'more -r'])

    expect(TTY::Pager::SystemPager)
      .to have_received(:find_executable).with('less -r', 'more -r')
  end
end
