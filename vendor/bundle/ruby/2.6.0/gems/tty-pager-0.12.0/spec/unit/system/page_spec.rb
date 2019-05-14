# frozen_string_literal: true

RSpec.describe TTY::Pager::SystemPager, '.page' do
  it "executes the pager command in a subprocess" do
    text     = "I try all things, I achieve what I can.\n"
    allow(TTY::Pager::SystemPager).to receive(:exec_available?).and_return(true)
    output   = double(:output, :tty? => true)
    pager    = described_class.new(output: output)
    write_io = spy
    pid      = 12345

    allow(pager).to receive(:open).and_return(write_io)
    allow(write_io).to receive(:pid).and_return(pid)
    status = double(:status, :success? => true)
    allow(Process).to receive(:waitpid2).with(pid, any_args).and_return([1, status])

    expect(pager.page(text)).to eq(true)
    expect(write_io).to have_received(:write).with(text)
    expect(write_io).to have_received(:close)
  end
end
