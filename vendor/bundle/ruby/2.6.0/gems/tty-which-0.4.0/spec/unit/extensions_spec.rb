# encoding: utf-8

RSpec.describe TTY::Which, '#extensions' do
  it "provides extensions" do
    exts = [".COM", ".EXE", ".BAT", ".CMD", ".VBS", ".RB", ".RBW"]
    exts_path = exts.join(::File::PATH_SEPARATOR)
    allow(ENV).to receive(:[]).with('PATHEXT').and_return(exts_path)

    expect(TTY::Which.extensions).to eq(exts)
  end

  it "finds no extensions" do
    allow(ENV).to receive(:[]).with('PATHEXT').and_return(nil)
    expect(TTY::Which.extensions).to eq([''])
  end
end
