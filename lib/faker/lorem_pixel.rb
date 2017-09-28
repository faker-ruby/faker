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
          positional_args = [:size, :grayscale, :category, :id, :text]
          options = Hash[positional_args.zip(args)].compact!
        end
        create_image(options)
      end

      private
      def create_image(size: '300x300', grayscale: false, category: nil, id: nil, text: nil)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size.match(/^[0-9]+x[0-9]+$/)
        raise ArgumentError, "Supported categories are #{SUPPORTED_CATEGORIES.join(', ')}" unless category.nil? || SUPPORTED_CATEGORIES.include?(category)
        raise ArgumentError, 'Category required when number is passed' if !number.nil? && category.nil?
        raise ArgumentError, 'Number must be between 1 and 10' unless number.nil? || (1..10).include?(number)
        raise ArgumentError, 'Category and number must be passed when text is passed' if !text.nil? && number.nil? && category.nil?

        url_parts = ['http://lorempixel.com']
        url_parts << 'g' if grayscale
        url_parts += size.split('x')
        url_parts += [category, id, text].compact
        url_parts.join('/')
      end
    end
  end
end
