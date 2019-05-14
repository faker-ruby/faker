require 'spec_helper'
require 'rainbow/wrapper'

module Rainbow
  RSpec.describe Wrapper do
    let(:wrapper) { described_class.new(enabled) }

    it "is enabled by default" do
      expect(described_class.new.enabled).to be(true)
    end

    describe '#wrap' do
      subject { wrapper.wrap(object) }

      let(:object) { Object.new }

      context "when wrapping is enabled" do
        let(:enabled) { true }

        it { should eq(object.to_s) }
        it { should be_kind_of(Rainbow::Presenter) }
      end

      context "when wrapping is disabled" do
        let(:enabled) { false }

        it { should eq(object.to_s) }
        it { should be_kind_of(Rainbow::NullPresenter) }
      end
    end
  end
end
