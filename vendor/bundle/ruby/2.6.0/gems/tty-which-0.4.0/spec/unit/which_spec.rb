# coding: utf-8

RSpec.describe TTY::Which, '#which' do

  before { stub_const("Which", described_class) }

  context "without extension" do
    let(:path) { "/bin:/usr/bin:/usr/local/bin:/opt/local/bin" }
    let(:cmds) { %w(/usr/bin/ls /bin/sh /usr/bin/ruby /usr/local/git/bin/git) }

    before do
      allow(ENV).to receive(:[]).with('PATHEXT').and_return(nil)
      allow(ENV).to receive(:[]).with('PATH').and_return(path)
      stub_const("::File::PATH_SEPARATOR", ':')
      stub_const("::File::SEPARATOR", '/')
      allow(Dir).to receive(:exist?) { true }
    end

    it "handles path with executable file /bin/sh" do
      allow(Which).to receive(:file_with_path?) { true }
      allow(Which).to receive(:executable_file?) { true }

      expect(Which.which('/bin/sh')).to eq('/bin/sh')
    end

    it "fails to find path executable" do
      allow(Which).to receive(:file_with_path?) { true }
      allow(Which).to receive(:executable_file?) { false }

      expect(Which.which('/bin/sh')).to eq(nil)
    end

    it "searches executable file git" do
      dir_path = "/usr/local/bin"
      cmd = "git"
      expected_path = "#{dir_path}/#{cmd}"
      allow(Which).to receive(:file_with_path?) { false }
      allow(Which).to receive(:file_with_exec_ext?) { false }

      allow(::File).to receive(:join)
      allow(::File).to receive(:join).with(dir_path, cmd).and_return(expected_path)
      allow(Which).to receive(:executable_file?) { false }
      allow(Which).to receive(:executable_file?).with(expected_path) { true }
      allow(::File).to receive(:absolute_path).with(expected_path).
        and_return(expected_path)

      expect(Which.which(cmd)).to eq(expected_path)
    end

    it "allows to search through custom paths" do
      paths = %w(/usr/local/bin /usr/bin /bin)
      allow(Which).to receive(:executable_file?).with('/usr/local/bin/ruby') { false }
      allow(Which).to receive(:executable_file?).with('/usr/bin/ruby') { true }
      allow(::File).to receive(:absolute_path).with('/usr/bin/ruby').and_return('/usr/bin/ruby')

      expect(TTY::Which.which('ruby', paths: paths)).to eq('/usr/bin/ruby')
    end
  end

  context "with extension" do
    let(:path) { "C:\\Program Files\\Git\\bin;" }
    let(:exts) { ".com;.exe;.bat;.cmd" }

    before do
      allow(ENV).to receive(:[]).with('PATHEXT').and_return(exts)
      allow(ENV).to receive(:[]).with('PATH').and_return(path)
      stub_const("::File::PATH_SEPARATOR", ';')
      stub_const("::File::SEPARATOR", '\\')
      allow(Dir).to receive(:exist?) { true }
    end

    it "handles path with executable file C:\\Program Files\\Git\\bin\\git" do
      allow(Which).to receive(:file_with_path?) { true }
      allow(Which).to receive(:executable_file?).with(any_args) { false }

      path_with_exe_file = 'C:\Program Files\Git\bin\git'
      expected_path = "#{path_with_exe_file}.exe"

      allow(::File).to receive(:join).with(path_with_exe_file, any_args).
        and_return(path_with_exe_file)
      allow(::File).to receive(:join).with(path_with_exe_file, '.exe').
        and_return(expected_path)
      allow(Which).to receive(:executable_file?).with(expected_path) { true }
      allow(::File).to receive(:absolute_path).and_return(expected_path)

      expect(Which.which(path_with_exe_file)).to eq(expected_path)
    end

    it "searches path for executable git.exe" do
      dir_path = "C:\\Program Files\\Git\\bin"
      cmd = 'git.exe'
      expected_path = "#{dir_path}\\#{cmd}"
      allow(Which).to receive(:file_with_path?) { false }
      allow(Which).to receive(:file_with_exec_ext?).with(cmd) { true }

      allow(::File).to receive(:join).with(dir_path, any_args)
      allow(::File).to receive(:join).with(dir_path, cmd).and_return(expected_path)
      allow(Which).to receive(:executable_file?).with(any_args) { false }
      allow(Which).to receive(:executable_file?).with(expected_path) { true }
      allow(::File).to receive(:absolute_path).with(expected_path).
        and_return(expected_path)

      expect(Which.which(cmd)).to eq(expected_path)
      expect(::File).to have_received(:absolute_path).with(expected_path)
    end

    it "searches path for executable git" do
      dir_path = "C:\\Program Files\\Git\\bin"
      cmd = 'git'
      expected_path = "#{dir_path}\\#{cmd}.exe"
      allow(Which).to receive(:file_with_path?) { false }
      allow(Which).to receive(:file_with_exec_ext?).with(cmd) { false }

      allow(::File).to receive(:join).with(dir_path, any_args)
      allow(::File).to receive(:join).with(dir_path, "#{cmd}.exe").
        and_return(expected_path)
      allow(Which).to receive(:executable_file?).with(any_args) { false }
      allow(Which).to receive(:executable_file?).with(expected_path) { true }
      allow(::File).to receive(:absolute_path).with(expected_path).
        and_return(expected_path)

      expect(Which.which(cmd)).to eq(expected_path)
      expect(::File).to have_received(:absolute_path).with(expected_path)
    end
  end
end
