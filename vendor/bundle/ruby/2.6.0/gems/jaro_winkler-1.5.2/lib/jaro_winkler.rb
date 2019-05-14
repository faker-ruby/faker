# frozen_string_literal: true

require 'jaro_winkler/version'

if RUBY_ENGINE == 'ruby'
  require 'jaro_winkler/jaro_winkler_ext'
else
  require 'jaro_winkler/jaro_winkler_pure'
end
