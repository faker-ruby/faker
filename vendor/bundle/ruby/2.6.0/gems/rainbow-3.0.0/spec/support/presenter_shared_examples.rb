RSpec.shared_examples_for "presenter with shortcut color methods" do
  %i[black red green yellow blue magenta cyan white aqua].each do |name|
    describe "##{name}" do
      subject { presenter.public_send(name) }

      it { should eq(presenter.color(name)) }
    end
  end
end
