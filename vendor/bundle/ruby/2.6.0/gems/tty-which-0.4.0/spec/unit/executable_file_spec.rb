# encoding: utf-8

RSpec.describe TTY::Which, '#executable_file?' do
  it "checks if file is executable" do
    allow(::File).to receive(:join).with('/usr/local/bin', 'ruby').
      and_return('/usr/local/bin/ruby')

    allow(::File).to receive(:file?).and_return(true)
    allow(::File).to receive(:executable?).with('/usr/local/bin/ruby').and_return(true)

    expect(TTY::Which.executable_file?('ruby', '/usr/local/bin')).to eq(true)
  end
end
