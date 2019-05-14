# frozen_string_literal: true

require 'i18n/backend/base'

module I18n
  module Backend
    # A simple backend that reads translations from YAML files and stores them in
    # an in-memory hash. Relies on the Base backend.
    #
    # The implementation is provided by a Implementation module allowing to easily
    # extend Simple backend's behavior by including modules. E.g.:
    #
    # module I18n::Backend::Pluralization
    #   def pluralize(*args)
    #     # extended pluralization logic
    #     super
    #   end
    # end
    #
    # I18n::Backend::Simple.include(I18n::Backend::Pluralization)
    class Simple
      using I18n::HashRefinements

      (class << self; self; end).class_eval { public :include }

      module Implementation
        include Base

        def initialized?
          @initialized ||= false
        end

        # Stores translations for the given locale in memory.
        # This uses a deep merge for the translations hash, so existing
        # translations will be overwritten by new ones only at the deepest
        # level of the hash.
        def store_translations(locale, data, options = EMPTY_HASH)
          if I18n.enforce_available_locales &&
            I18n.available_locales_initialized? &&
            !I18n.available_locales.include?(locale.to_sym) &&
            !I18n.available_locales.include?(locale.to_s)
            return data
          end
          locale = locale.to_sym
          translations[locale] ||= {}
          data = data.deep_symbolize_keys
          translations[locale].deep_merge!(data)
        end

        # Get available locales from the translations hash
        def available_locales
          init_translations unless initialized?
          translations.inject([]) do |locales, (locale, data)|
            locales << locale unless data.size <= 1 && (data.empty? || data.has_key?(:i18n))
            locales
          end
        end

        # Clean up translations hash and set initialized to false on reload!
        def reload!
          @initialized = false
          @translations = nil
          super
        end

        def translations(do_init: false)
          # To avoid returning empty translations,
          # call `init_translations`
          init_translations if do_init && !initialized?

          @translations ||= {}
        end

      protected

        def init_translations
          load_translations
          @initialized = true
        end

        # Looks up a translation from the translations hash. Returns nil if
        # either key is nil, or locale, scope or key do not exist as a key in the
        # nested translations hash. Splits keys or scopes containing dots
        # into multiple keys, i.e. <tt>currency.format</tt> is regarded the same as
        # <tt>%w(currency format)</tt>.
        def lookup(locale, key, scope = [], options = EMPTY_HASH)
          init_translations unless initialized?
          keys = I18n.normalize_keys(locale, key, scope, options[:separator])

          keys.inject(translations) do |result, _key|
            return nil unless result.is_a?(Hash)
            unless result.has_key?(_key)
              _key = _key.to_s.to_sym
              return nil unless result.has_key?(_key)
            end
            result = result[_key]
            result = resolve(locale, _key, result, options.merge(:scope => nil)) if result.is_a?(Symbol)
            result
          end
        end
      end

      include Implementation
    end
  end
end
