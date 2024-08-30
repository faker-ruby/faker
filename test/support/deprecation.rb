# frozen_string_literal: true

# Based on Rails Testing Deprecator
# https://github.com/rails/rails/blob/main/activesupport/lib/active_support/testing/deprecation.rb

# Asserts that a matching deprecation warning was emitted during the execution of the yielded block.
#
#   assert_deprecated do
#     DeprecatedGenerator.generate
#   end
#
def assert_deprecated(&block)
  warning = with_captured_stdout(&block)
  result = yield block

  refute_predicate warning, :empty?, 'Expected a deprecation warning within the block but received none'

  result
end

# Asserts that no deprecation warnings are emitted during the execution of the yielded block.
#
#   assert_not_deprecated do
#     Faker::Internet.email
#   end
def assert_not_deprecated(&block)
  warning = with_captured_stdout(&block)
  result = yield block

  assert_predicate warning, :empty?, "Expected no deprecation warning within the block but received a deprecation: #{warning}"
  result
end

def with_captured_stdout(&block)
  original_stdout = $stdout
  $stdout = StringIO.new
  yield block
  $stdout.string
ensure
  $stdout = original_stdout
end
