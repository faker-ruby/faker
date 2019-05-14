# frozen_string_literal: true

require 'concurrent/map'

require 'i18n/version'
require 'i18n/exceptions'
require 'i18n/interpolate/ruby'

module I18n
  autoload :Backend, 'i18n/backend'
  autoload :Config,  'i18n/config'
  autoload :Gettext, 'i18n/gettext'
  autoload :Locale,  'i18n/locale'
  autoload :Tests,   'i18n/tests'
  autoload :Middleware,   'i18n/middleware'

  RESERVED_KEYS = %i[
    cascade
    deep_interpolation
    default
    exception_handler
    fallback
    fallback_in_progress
    format
    object
    raise
    resolve
    scope
    separator
    throw
  ].freeze
  RESERVED_KEYS_PATTERN = /%\{(#{RESERVED_KEYS.join("|")})\}/
  EMPTY_HASH = {}.freeze

  def self.new_double_nested_cache # :nodoc:
    Concurrent::Map.new { |h,k| h[k] = Concurrent::Map.new }
  end

  module Base
    # Gets I18n configuration object.
    def config
      Thread.current[:i18n_config] ||= I18n::Config.new
    end

    # Sets I18n configuration object.
    def config=(value)
      Thread.current[:i18n_config] = value
    end

    # Write methods which delegates to the configuration object
    %w(locale backend default_locale available_locales default_separator
      exception_handler load_path enforce_available_locales).each do |method|
      module_eval <<-DELEGATORS, __FILE__, __LINE__ + 1
        def #{method}
          config.#{method}
        end

        def #{method}=(value)
          config.#{method} = (value)
        end
      DELEGATORS
    end

    # Tells the backend to reload translations. Used in situations like the
    # Rails development environment. Backends can implement whatever strategy
    # is useful.
    def reload!
      config.clear_available_locales_set
      config.backend.reload!
    end

    # Translates, pluralizes and interpolates a given key using a given locale,
    # scope, and default, as well as interpolation values.
    #
    # *LOOKUP*
    #
    # Translation data is organized as a nested hash using the upper-level keys
    # as namespaces. <em>E.g.</em>, ActionView ships with the translation:
    # <tt>:date => {:formats => {:short => "%b %d"}}</tt>.
    #
    # Translations can be looked up at any level of this hash using the key argument
    # and the scope option. <em>E.g.</em>, in this example <tt>I18n.t :date</tt>
    # returns the whole translations hash <tt>{:formats => {:short => "%b %d"}}</tt>.
    #
    # Key can be either a single key or a dot-separated key (both Strings and Symbols
    # work). <em>E.g.</em>, the short format can be looked up using both:
    #   I18n.t 'date.formats.short'
    #   I18n.t :'date.formats.short'
    #
    # Scope can be either a single key, a dot-separated key or an array of keys
    # or dot-separated keys. Keys and scopes can be combined freely. So these
    # examples will all look up the same short date format:
    #   I18n.t 'date.formats.short'
    #   I18n.t 'formats.short', :scope => 'date'
    #   I18n.t 'short', :scope => 'date.formats'
    #   I18n.t 'short', :scope => %w(date formats)
    #
    # *INTERPOLATION*
    #
    # Translations can contain interpolation variables which will be replaced by
    # values passed to #translate as part of the options hash, with the keys matching
    # the interpolation variable names.
    #
    # <em>E.g.</em>, with a translation <tt>:foo => "foo %{bar}"</tt> the option
    # value for the key +bar+ will be interpolated into the translation:
    #   I18n.t :foo, :bar => 'baz' # => 'foo baz'
    #
    # *PLURALIZATION*
    #
    # Translation data can contain pluralized translations. Pluralized translations
    # are arrays of singluar/plural versions of translations like <tt>['Foo', 'Foos']</tt>.
    #
    # Note that <tt>I18n::Backend::Simple</tt> only supports an algorithm for English
    # pluralization rules. Other algorithms can be supported by custom backends.
    #
    # This returns the singular version of a pluralized translation:
    #   I18n.t :foo, :count => 1 # => 'Foo'
    #
    # These both return the plural version of a pluralized translation:
    #   I18n.t :foo, :count => 0 # => 'Foos'
    #   I18n.t :foo, :count => 2 # => 'Foos'
    #
    # The <tt>:count</tt> option can be used both for pluralization and interpolation.
    # <em>E.g.</em>, with the translation
    # <tt>:foo => ['%{count} foo', '%{count} foos']</tt>, count will
    # be interpolated to the pluralized translation:
    #   I18n.t :foo, :count => 1 # => '1 foo'
    #
    # *DEFAULTS*
    #
    # This returns the translation for <tt>:foo</tt> or <tt>default</tt> if no translation was found:
    #   I18n.t :foo, :default => 'default'
    #
    # This returns the translation for <tt>:foo</tt> or the translation for <tt>:bar</tt> if no
    # translation for <tt>:foo</tt> was found:
    #   I18n.t :foo, :default => :bar
    #
    # Returns the translation for <tt>:foo</tt> or the translation for <tt>:bar</tt>
    # or <tt>default</tt> if no translations for <tt>:foo</tt> and <tt>:bar</tt> were found.
    #   I18n.t :foo, :default => [:bar, 'default']
    #
    # *BULK LOOKUP*
    #
    # This returns an array with the translations for <tt>:foo</tt> and <tt>:bar</tt>.
    #   I18n.t [:foo, :bar]
    #
    # Can be used with dot-separated nested keys:
    #   I18n.t [:'baz.foo', :'baz.bar']
    #
    # Which is the same as using a scope option:
    #   I18n.t [:foo, :bar], :scope => :baz
    #
    # *LAMBDAS*
    #
    # Both translations and defaults can be given as Ruby lambdas. Lambdas will be
    # called and passed the key and options.
    #
    # E.g. assuming the key <tt>:salutation</tt> resolves to:
    #   lambda { |key, options| options[:gender] == 'm' ? "Mr. #{options[:name]}" : "Mrs. #{options[:name]}" }
    #
    # Then <tt>I18n.t(:salutation, :gender => 'w', :name => 'Smith') will result in "Mrs. Smith".
    #
    # Note that the string returned by lambda will go through string interpolation too,
    # so the following lambda would give the same result:
    #   lambda { |key, options| options[:gender] == 'm' ? "Mr. %{name}" : "Mrs. %{name}" }
    #
    # It is recommended to use/implement lambdas in an "idempotent" way. E.g. when
    # a cache layer is put in front of I18n.translate it will generate a cache key
    # from the argument values passed to #translate. Therefor your lambdas should
    # always return the same translations/values per unique combination of argument
    # values.
    def translate(*args)
      options  = args.last.is_a?(Hash) ? args.pop.dup : {}
      key      = args.shift
      backend  = config.backend
      locale   = options.delete(:locale) || config.locale
      handling = options.delete(:throw) && :throw || options.delete(:raise) && :raise # TODO deprecate :raise

      enforce_available_locales!(locale)

      result = catch(:exception) do
        if key.is_a?(Array)
          key.map { |k| backend.translate(locale, k, options) }
        else
          backend.translate(locale, key, options)
        end
      end
      result.is_a?(MissingTranslation) ? handle_exception(handling, result, locale, key, options) : result
    end
    alias :t :translate

    # Wrapper for <tt>translate</tt> that adds <tt>:raise => true</tt>. With
    # this option, if no translation is found, it will raise <tt>I18n::MissingTranslationData</tt>
    def translate!(key, options = EMPTY_HASH)
      translate(key, options.merge(:raise => true))
    end
    alias :t! :translate!

    # Returns true if a translation exists for a given key, otherwise returns false.
    def exists?(key, locale = config.locale)
      raise I18n::ArgumentError if key.is_a?(String) && key.empty?
      config.backend.exists?(locale, key)
    end

    # Transliterates UTF-8 characters to ASCII. By default this method will
    # transliterate only Latin strings to an ASCII approximation:
    #
    #    I18n.transliterate("Ærøskøbing")
    #    # => "AEroskobing"
    #
    #    I18n.transliterate("日本語")
    #    # => "???"
    #
    # It's also possible to add support for per-locale transliterations. I18n
    # expects transliteration rules to be stored at
    # <tt>i18n.transliterate.rule</tt>.
    #
    # Transliteration rules can either be a Hash or a Proc. Procs must accept a
    # single string argument. Hash rules inherit the default transliteration
    # rules, while Procs do not.
    #
    # *Examples*
    #
    # Setting a Hash in <locale>.yml:
    #
    #    i18n:
    #      transliterate:
    #        rule:
    #          ü: "ue"
    #          ö: "oe"
    #
    # Setting a Hash using Ruby:
    #
    #     store_translations(:de, :i18n => {
    #       :transliterate => {
    #         :rule => {
    #           "ü" => "ue",
    #           "ö" => "oe"
    #         }
    #       }
    #     )
    #
    # Setting a Proc:
    #
    #     translit = lambda {|string| MyTransliterator.transliterate(string) }
    #     store_translations(:xx, :i18n => {:transliterate => {:rule => translit})
    #
    # Transliterating strings:
    #
    #     I18n.locale = :en
    #     I18n.transliterate("Jürgen") # => "Jurgen"
    #     I18n.locale = :de
    #     I18n.transliterate("Jürgen") # => "Juergen"
    #     I18n.transliterate("Jürgen", :locale => :en) # => "Jurgen"
    #     I18n.transliterate("Jürgen", :locale => :de) # => "Juergen"
    def transliterate(*args)
      options      = args.pop.dup if args.last.is_a?(Hash)
      key          = args.shift
      locale       = options && options.delete(:locale) || config.locale
      handling     = options && (options.delete(:throw) && :throw || options.delete(:raise) && :raise)
      replacement  = options && options.delete(:replacement)
      enforce_available_locales!(locale)
      config.backend.transliterate(locale, key, replacement)
    rescue I18n::ArgumentError => exception
      handle_exception(handling, exception, locale, key, options || {})
    end

    # Localizes certain objects, such as dates and numbers to local formatting.
    def localize(object, options = nil)
      options = options ? options.dup : {}
      locale = options.delete(:locale) || config.locale
      format = options.delete(:format) || :default
      enforce_available_locales!(locale)
      config.backend.localize(locale, object, format, options)
    end
    alias :l :localize

    # Executes block with given I18n.locale set.
    def with_locale(tmp_locale = nil)
      if tmp_locale
        current_locale = self.locale
        self.locale    = tmp_locale
      end
      yield
    ensure
      self.locale = current_locale if tmp_locale
    end

    # Merges the given locale, key and scope into a single array of keys.
    # Splits keys that contain dots into multiple keys. Makes sure all
    # keys are Symbols.
    def normalize_keys(locale, key, scope, separator = nil)
      separator ||= I18n.default_separator

      keys = []
      keys.concat normalize_key(locale, separator)
      keys.concat normalize_key(scope, separator)
      keys.concat normalize_key(key, separator)
      keys
    end

    # Returns true when the passed locale, which can be either a String or a
    # Symbol, is in the list of available locales. Returns false otherwise.
    def locale_available?(locale)
      I18n.config.available_locales_set.include?(locale)
    end

    # Raises an InvalidLocale exception when the passed locale is not available.
    def enforce_available_locales!(locale)
      if config.enforce_available_locales
        raise I18n::InvalidLocale.new(locale) if !locale_available?(locale)
      end
    end

    def available_locales_initialized?
      config.available_locales_initialized?
    end

  private

    # Any exceptions thrown in translate will be sent to the @@exception_handler
    # which can be a Symbol, a Proc or any other Object unless they're forced to
    # be raised or thrown (MissingTranslation).
    #
    # If exception_handler is a Symbol then it will simply be sent to I18n as
    # a method call. A Proc will simply be called. In any other case the
    # method #call will be called on the exception_handler object.
    #
    # Examples:
    #
    #   I18n.exception_handler = :custom_exception_handler              # this is the default
    #   I18n.custom_exception_handler(exception, locale, key, options)  # will be called like this
    #
    #   I18n.exception_handler = lambda { |*args| ... }                 # a lambda
    #   I18n.exception_handler.call(exception, locale, key, options)    # will be called like this
    #
    #   I18n.exception_handler = I18nExceptionHandler.new               # an object
    #   I18n.exception_handler.call(exception, locale, key, options)    # will be called like this
    def handle_exception(handling, exception, locale, key, options)
      case handling
      when :raise
        raise exception.respond_to?(:to_exception) ? exception.to_exception : exception
      when :throw
        throw :exception, exception
      else
        case handler = options[:exception_handler] || config.exception_handler
        when Symbol
          send(handler, exception, locale, key, options)
        else
          handler.call(exception, locale, key, options)
        end
      end
    end

    @@normalized_key_cache = I18n.new_double_nested_cache

    def normalize_key(key, separator)
      @@normalized_key_cache[separator][key] ||=
        case key
        when Array
          key.map { |k| normalize_key(k, separator) }.flatten
        else
          keys = key.to_s.split(separator)
          keys.delete('')
          keys.map! do |k|
            case k
            when /\A[-+]?\d+\z/ # integer
              k.to_i
            when 'true'
              true
            when 'false'
              false
            else
              k.to_sym
            end
          end
          keys
        end
    end
  end

  extend Base
end
