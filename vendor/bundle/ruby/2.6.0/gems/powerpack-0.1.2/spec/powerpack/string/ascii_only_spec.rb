# encoding: utf-8

require 'spec_helper'

unless defined?(RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
  describe 'String#ascii_only' do
    it 'returns same value for string with ASCII chars only' do
      expect('abc'.ascii_only).to eq 'abc'
    end

    it 'returns string without non-ASCII chars' do
      expect("abc\u{6666}".force_encoding("UTF-8").ascii_only).to eq 'abc'
    end

    it 'returns string without non-ASCII chars and with ASCII chars' do
      expect("\u{6666}".force_encoding("UTF-8").ascii_only).to eq ''
    end

    it 'does not change the original string' do
      string = "abc\u{6666}".force_encoding("UTF-8")
      string.ascii_only
      expect(string).to eq "abc\u{6666}".force_encoding("UTF-8")
    end
  end

  describe 'String#ascii_only!' do
    it 'returns same value for string with ASCII chars only' do
      expect('abc'.ascii_only!).to eq 'abc'
    end

    it 'returns string without non-ASCII chars' do
      expect("abc\u{6666}".force_encoding("UTF-8").ascii_only!).to eq 'abc'
    end

    it 'returns string without non-ASCII chars and with ASCII chars' do
      expect("\u{6666}".force_encoding("UTF-8").ascii_only!).to eq ''
    end

    it 'changes the original string' do
      string = "abc\u{6666}".force_encoding("UTF-8")
      string.ascii_only!
      expect(string).to eq 'abc'
    end
  end
end
