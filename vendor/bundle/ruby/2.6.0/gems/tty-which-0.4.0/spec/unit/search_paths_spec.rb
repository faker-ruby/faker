# encoding: utf-8

RSpec.describe TTY::Which, '#search_paths' do
  it "defauls search paths" do
    allow(ENV).to receive(:[]).with('PATH').and_return([])
    allow(Dir).to receive(:exist?).and_return(true)

    expect(TTY::Which.search_paths).to eq([
      '/usr/local/bin', '/usr/ucb', '/usr/bin', '/bin'])
  end

  it "finds paths in path environment" do
    paths = ['/bin', '/usr/bin', '/usr/local/bin', '/opt/local/bin']
    path = paths.join(::File::PATH_SEPARATOR)
    allow(ENV).to receive(:[]).with('PATH').and_return(path)
    allow(Dir).to receive(:exist?).and_return(true)

    expect(TTY::Which.search_paths).to eq(paths)
  end

  it "accepts paths to search as an argument" do
    paths = ['/bin', '/usr/bin', '/usr/local/bin', '/opt/local/bin']
    path = paths.join(::File::PATH_SEPARATOR)
    allow(Dir).to receive(:exist?).and_return(true)

    expect(TTY::Which.search_paths(path)).to eq(paths)
  end
end
