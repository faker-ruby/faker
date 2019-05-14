# frozen_string_literal: true

RSpec.describe TTY::Pager::SystemPager do
  it "provides executable names" do
    allow(ENV).to receive(:[]).with('GIT_PAGER').and_return(nil)
    allow(ENV).to receive(:[]).with('PAGER').and_return(nil)
    allow(described_class).to receive(:command_exists?).with('git').and_return(false)

    expect(described_class.executables).to eq(['less -r', 'more -r', 'most', 'cat', 'pager', 'pg'])
  end
end
