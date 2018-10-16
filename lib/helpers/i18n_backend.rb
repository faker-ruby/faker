# frozen_string_literal: true

module Faker
  class I18nBackend < I18n::Backend::Simple
    def init_translations
      load_translations Dir[::File.join(__dir__, '..', 'locales', '**/*.yml')]
      @initialized = true
    end
  end
end
