# frozen_string_literal

RSpec.describe TTY::Which, '#exist?' do
  it "finds executable in the path" do
    allow(TTY::Which).to receive(:which).with('ruby', a_hash_including(:paths)).
      and_return('/usr/loca/bin/ruby')

    expect(TTY::Which.exist?('ruby')).to be(true)
  end

  it "fails to find executable in the path" do
    allow(TTY::Which).to receive(:which).with('ruby', a_hash_including(:paths)).and_return(nil)

    expect(TTY::Which.exist?('ruby')).to be(false)
  end
end
