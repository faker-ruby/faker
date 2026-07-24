# frozen_string_literal: true

require_relative 'test_helper'

class TestLocaleDataIntegrity < Test::Unit::TestCase
  LOCALES_DIR = File.expand_path('../lib/locales', __dir__)

  # Keys whose values intentionally contain runs of spaces (column alignment
  # inside a comma-separated string that the generator strips before use).
  ALIGNED_KEYS = ['crypto_coin.coin'].freeze

  def test_no_accidental_consecutive_spaces_in_locale_data
    offenders = []

    Dir.glob(File.join(LOCALES_DIR, '**', '*.yml')).each do |file|
      data = YAML.load_file(file, aliases: true)
      rel = file.sub("#{LOCALES_DIR}/", '')
      each_string(data, []) do |path, value|
        next if ALIGNED_KEYS.any? { |k| path.join('.').include?(k) }

        offenders << "#{rel} @ #{path.join('.')}: #{value.inspect}" if value.match?(/\S {2,}\S/)
      end
    end

    assert_empty offenders, <<~MSG
      Locale data must not contain runs of consecutive spaces between words.
      Browsers collapse whitespace when rendering, so generated values that
      carry double spaces break exact-text assertions in downstream test suites.
      Offending entries:
      #{offenders.join("\n")}
    MSG
  end

  private

  def each_string(node, path, &block)
    case node
    when Hash
      node.each { |key, value| each_string(value, path + [key], &block) }
    when Array
      node.each_with_index { |value, index| each_string(value, path + [index], &block) }
    when String
      block.call(path, node)
    end
  end
end
