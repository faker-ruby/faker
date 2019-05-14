require 'bacon'
require 'bacon/colored_output'

require 'simplecov'
require 'coveralls'

SimpleCov.start do
  self.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ])

  # Exclude the testsuite itself.
  add_filter "/test/"
end

require 'ast'
