# encoding: utf-8

RSpec.describe TTY::Which, "#file_with_exec_ext?" do
  it "detects executable extension" do
    filename = 'file.exe'
    allow(TTY::Which).to receive(:extensions).and_return(['.EXE', '.BAT', '.CMD'])

    expect(TTY::Which.file_with_exec_ext?(filename)).to eq(true)
  end

  it "fails to detect executable extension" do
    filename = 'file.unknown'
    allow(TTY::Which).to receive(:extensions).and_return(['.EXE', '.BAT'])

    expect(TTY::Which.file_with_exec_ext?(filename)).to eq(false)
  end
end

