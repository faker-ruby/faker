module Faker
  class LoremPixel < Base
    class << self
      SUPPORTED_CATEGORIES = %w(abstract animals business cats city food nightlife fashion people nature sports technics transport)

      def image(*args)
        if args.length == 1 && args[0].is_a?(Hash)
          options = args[0]
        else
          # LoremPixel used to have positional arguments. This is now deprecated in favor of named arguments
          # However, in order to prevent breaking existing applications, shim the arguments into a hash
          raise ArgumentError, 'Arguments can be passed as a hash, or positionally, but not both' if args.any?{ |arg| arg.is_a?(Hash) }
          names = [:size, :grayscale, :category, :id, :text]
          options = Faker::Arguments::to_named(args, names)
        end
        create_image(options)
      end

      private
      def create_image(size: '300x300', grayscale: false, category: nil, id: nil, text: nil)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size.match(/^[0-9]+x[0-9]+$/)
        raise ArgumentError, "Supported categories are #{SUPPORTED_CATEGORIES.join(', ')}" unless category.nil? || SUPPORTED_CATEGORIES.include?(category)
        raise ArgumentError, 'Category required when number is passed' if !id.nil? && category.nil?
        raise ArgumentError, 'Id must be between 1 and 10' unless id.nil? || (1..10).include?(id)
        raise ArgumentError, 'Category and Id must be passed when text is passed' if !text.nil? && id.nil? && category.nil?

        url_parts = ['http://lorempixel.com']
        url_parts << 'g' if grayscale
        url_parts += size.split('x')
        url_parts += [category, id, text].compact
        url_parts.join('/')
      end
    end
  end
end
