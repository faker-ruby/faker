require 'spec_helper'
require 'rainbow/null_presenter'

module Rainbow
  RSpec.describe NullPresenter do
    let(:presenter) { described_class.new('hello') }

    shared_examples_for "rainbow null string method" do
      it "doesn't wrap the text with any sgr sequence" do
        expect(subject).to eq('hello')
      end

      it "returns an instance of Rainbow::NullPresenter" do
        expect(subject).to be_kind_of(Rainbow::NullPresenter)
      end
    end

    describe '#color' do
      subject { presenter.color(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#foreground' do
      subject { presenter.foreground(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#fg' do
      subject { presenter.fg(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#background' do
      subject { presenter.background(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#bg' do
      subject { presenter.bg(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#reset' do
      subject { presenter.reset }

      it_behaves_like "rainbow null string method"
    end

    describe '#bright' do
      subject { presenter.bright }

      it_behaves_like "rainbow null string method"
    end

    describe '#bold' do
      subject { presenter.bold }

      it_behaves_like "rainbow null string method"
    end

    describe '#faint' do
      subject { presenter.faint }

      it_behaves_like "rainbow null string method"
    end

    describe '#dark' do
      subject { presenter.dark }

      it_behaves_like "rainbow null string method"
    end

    describe '#italic' do
      subject { presenter.italic }

      it_behaves_like "rainbow null string method"
    end

    describe '#underline' do
      subject { presenter.underline }

      it_behaves_like "rainbow null string method"
    end

    describe '#blink' do
      subject { presenter.blink }

      it_behaves_like "rainbow null string method"
    end

    describe '#inverse' do
      subject { presenter.inverse }

      it_behaves_like "rainbow null string method"
    end

    describe '#hide' do
      subject { presenter.hide }

      it_behaves_like "rainbow null string method"
    end

    it_behaves_like "presenter with shortcut color methods"
  end
end
