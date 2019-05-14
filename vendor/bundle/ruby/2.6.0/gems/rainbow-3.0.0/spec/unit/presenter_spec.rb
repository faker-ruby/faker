require 'spec_helper'
require 'rainbow/presenter'

module Rainbow
  RSpec.describe Presenter do
    let(:presenter) { described_class.new('hello') }

    shared_examples_for "rainbow string method" do
      it "wraps the text with a sgr sequence" do
        expect(subject).to eq('[hello]')
      end

      it "returns an instance of Rainbow::Presenter" do
        expect(subject).to be_kind_of(Rainbow::Presenter)
      end
    end

    shared_examples_for "text color method" do
      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build)
          .with(:foreground, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr)
          .with('hello', [1, 2])
      end
    end

    shared_examples_for "text background method" do
      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build)
          .with(:background, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr)
          .with('hello', [1, 2])
      end
    end

    before do
      allow(StringUtils).to receive(:wrap_with_sgr) { '[hello]' }
    end

    describe '#color' do
      subject { presenter.color(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#foreground' do
      subject { presenter.foreground(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#fg' do
      subject { presenter.fg(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#background' do
      subject { presenter.background(:arg1, 'arg2') }

      it_behaves_like "text background method"
    end

    describe '#bg' do
      subject { presenter.bg(:arg1, 'arg2') }

      it_behaves_like "text background method"
    end

    describe '#reset' do
      subject { presenter.reset }

      it_behaves_like "rainbow string method"

      it 'wraps with 0 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [0])
      end
    end

    describe '#bright' do
      subject { presenter.bright }

      it_behaves_like "rainbow string method"

      it 'wraps with 1 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1])
      end
    end

    describe '#bold' do
      subject { presenter.bold }

      it_behaves_like "rainbow string method"

      it 'wraps with 1 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1])
      end
    end

    describe '#faint' do
      subject { presenter.faint }

      it_behaves_like "rainbow string method"

      it 'wraps with 2 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [2])
      end
    end

    describe '#dark' do
      subject { presenter.dark }

      it_behaves_like "rainbow string method"

      it 'wraps with 2 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [2])
      end
    end

    describe '#italic' do
      subject { presenter.italic }

      it_behaves_like "rainbow string method"

      it 'wraps with 3 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr)
          .with('hello', [3])
      end
    end

    describe '#underline' do
      subject { presenter.underline }

      it_behaves_like "rainbow string method"

      it 'wraps with 4 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [4])
      end
    end

    describe '#blink' do
      subject { presenter.blink }

      it_behaves_like "rainbow string method"

      it 'wraps with 5 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [5])
      end
    end

    describe '#inverse' do
      subject { presenter.inverse }

      it_behaves_like "rainbow string method"

      it 'wraps with 7 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [7])
      end
    end

    describe '#hide' do
      subject { presenter.hide }

      it_behaves_like "rainbow string method"

      it 'wraps with 8 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [8])
      end
    end

    it_behaves_like "presenter with shortcut color methods"
  end
end
