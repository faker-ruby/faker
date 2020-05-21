# frozen_string_literal: true

module Faker
  class Image < Base
    class << self
      # @private
      SUPPORTED_CATEGORIES_LOREM_PIXEL = %w[abstract
                                            animals
                                            business
                                            cats
                                            city
                                            food
                                            nightlife
                                            fashion
                                            people
                                            nature
                                            sports
                                            technics
                                            transport].freeze
      # @private
      SUPPORTED_FORMATS_ROBOHASH = %w[png jpg bmp].freeze
      # @private
      SUPPORTED_FORMATS_PLACEHOLDIT = %w[png jpg gif jpeg].freeze

      ##
      # Produces the URL of an image from Fill Murray, a site which hosts
      # exclusively photographs of actor Bill Murray.
      #
      # @param grayscale [Boolean] Whether to return a grayscale image.
      # @param width [Integer] The image width.
      # @param height [Integer] The image height.
      # @return [String]
      #
      # @example
      #   Faker::Image.fill_murray #=> "https://www.fillmurray.com/300/300"
      #
      # @example
      #   Faker::Image.fill_murray(grayscale: true)
      #     #=> "https://fillmurray.com/g/300/300"
      #
      # @example
      #   Faker::Image.fill_murray(grayscale: false, width: 200, height: 400)
      #     #=> "https://fillmurray.com/200/400"
      #
      # @faker.version next
      def fill_murray(grayscale: false, width: 200, height: 200)
        raise ArgumentError, 'Width should be a number' unless width.to_s =~ /^\d+$/
        raise ArgumentError, 'Height should be a number' unless height.to_s =~ /^\d+$/
        raise ArgumentError, 'Grayscale should be a boolean' unless [true, false].include?(grayscale)

        "https://www.fillmurray.com#{'/g' if grayscale == true}/#{width}/#{height}"
      end

      ##
      # Produces a URL for an image from lorempixel.com.
      #
      # @param size [String] Image size in pixels, in the format of 'AxB'
      # @param is_gray [Boolean] Whether or not the image is grayscale.
      # @param category [String, nil] The LoremPixel category for the image.
      # @param number [Integer, nil] A number between 1 and 10.
      # @param text [String, nil]
      # @param secure [Boolean] Whether or not to use https
      # @return [String] A lorempixel.com URL
      #
      # @example
      #   Faker::Image.lorem_pixel
      #     #=> "https://lorempixel.com/300/300"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60")
      #     #=> "https://lorempixel.com/50/60"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60", is_gray: true)
      #     #=> "https://lorempixel.com/g/50/60"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60", is_gray: false, category: 'sports')
      #     #=> "https://lorempixel.com/50/60/sports"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60", is_gray: false, category: 'sports', number: 3)
      #     #=> "https://lorempixel.com/50/60/sports/3"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60", is_gray: false, category: 'sports', number: 3, text: 'Dummy-text')
      #     #=> "https://lorempixel.com/50/60/sports/3/Dummy-text"
      # @example
      #   Faker::Image.lorem_pixel(size: "50x60", is_gray: false, category: 'sports', number: nil, text: 'Dummy-text')
      #     #=> "https://lorempixel.com/50/60/sports/Dummy-text"
      # @example
      #   Faker::Image.lorem_pixel(secure: false)
      #     #=> "http://lorempixel.com/300/300"
      #
      # @faker.version next
      # rubocop:disable Metrics/ParameterLists
      def lorem_pixel(size: '300x300', is_gray: false, category: nil, number: nil, text: nil, secure: true)
        # rubocop:enable Metrics/ParameterLists
        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported categories are #{SUPPORTED_CATEGORIES_LOREM_PIXEL.join(', ')}" unless category.nil? || SUPPORTED_CATEGORIES_LOREM_PIXEL.include?(category)
        raise ArgumentError, 'Category required when number is passed' if !number.nil? && category.nil?
        raise ArgumentError, 'Number must be between 1 and 10' unless number.nil? || (1..10).cover?(number)
        raise ArgumentError, 'Category and number must be passed when text is passed' if !text.nil? && number.nil? && category.nil?

        url_parts = secure ? ['https:/'] : ['http:/']
        url_parts << ['lorempixel.com']
        url_parts << 'g' if is_gray
        url_parts += size.split('x')
        url_parts += [category, number, text].compact
        url_parts.join('/')
      end

      ##
      # Produces a URL for an image from placehold.it.
      #
      # @param size [String] Image size in pixels, in the format of 'AxB'
      # @param format [String] An image format, one of png, jpg, gif, or jpeg.
      # @param background_color [String, Symbol, nil] The background color. Can be a hex value like 'ffffff', :random for a random value, or nil.
      # @param text_color [String, Symbol, nil] The text color. Can be a hex value like 'ffffff', :random for a random value, or nil.
      # @param text [String, nil] Text to populate the placeholder image with.
      # @return [String] A placehold.it URL.
      #
      # @example
      #   Faker::Image.placeholdit
      #     #=> "https://placehold.it/300x300.png"
      # @example
      #   Faker::Image.placeholdit(size: '50x50')
      #     #=> "https://placehold.it/50x50.png"
      # @example
      #   Faker::Image.placeholdit(size: '50x50', format: 'jpg')
      #     #=> "https://placehold.it/50x50.jpg"
      # @example
      #   Faker::Image.placeholdit(size: '50x50', format: 'gif', background_color: 'ffffff')
      #     #=> "https://placehold.it/50x50.gif/ffffff"
      # @example
      #   Faker::Image.placeholdit(size: '50x50', format: 'jpeg', background_color: :random)
      #     #=> "https://placehold.it/50x50.jpeg/39eba7"
      # @example
      #   Faker::Image.placeholdit(size: '50x50', format: 'jpeg', background_color: 'ffffff', text_color: '000')
      #     #=> "https://placehold.it/50x50.jpeg/ffffff/000"
      # @example
      #   Faker::Image.placeholdit(size: '50x50', format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text')
      #     #=> "https://placehold.it/50x50.jpg/ffffff/000?text=Some Custom Text"
      #
      # @faker.added next
      def placeholdit(size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
        background_color = generate_placeholdit_color if background_color == :random
        text_color = generate_placeholdit_color if text_color == :random

        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS_PLACEHOLDIT.join(', ')}" unless SUPPORTED_FORMATS_PLACEHOLDIT.include?(format)
        raise ArgumentError, "background_color must be a hex value without '#'" unless background_color.nil? || background_color =~ /((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/
        raise ArgumentError, "text_color must be a hex value without '#'" unless text_color.nil? || text_color =~ /((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/

        image_url = "https://placehold.it/#{size}.#{format}"
        image_url += "/#{background_color}" if background_color
        image_url += "/#{text_color}" if text_color
        image_url += "?text=#{text}" if text
        image_url
      end

      ##
      # Produces a URL for an avatar from robohash.org.
      #
      # @param slug [String, nil]
      # @param size [String] Image size in pixels, in the format of 'AxB'
      # @param format [String] The image file format
      # @param set [String] The avatar set to use
      # @param bgset [String, nil] The background set to use
      # @return [String] A robohash.org URL
      #
      # @example
      #   Faker::Image.robohash
      #     #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"
      # @example
      #   Faker::Image.robohash(slug: "my-own-slug")
      #     #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"
      # @example
      #   Faker::Image.robohash(slug: "my-own-slug", size: "50x50")
      #     #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"
      # @example
      #   Faker::Image.robohash(slug: "my-own-slug", size: "50x50", format: "jpg")
      #     #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"
      # @example
      #   Faker::Image.robohash(slug: "my-own-slug", size: "50x50", format: "bmp")
      #     #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"
      # @example
      #   Faker::Image.robohash(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1")
      #     #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
      #
      # @faker.version next
      def robohash(slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS_ROBOHASH.join(', ')}" unless SUPPORTED_FORMATS_ROBOHASH.include?(format)

        slug ||= Faker::Lorem.words.join
        bgset_query = "&bgset=#{bgset}" if bgset
        "https://robohash.org/#{slug}.#{format}?size=#{size}&set=#{set}#{bgset_query}"
      end

      ##
      # Produces a URL for an image from unsplash.com.
      #
      # @param category [String, nil] The category to get images from.
      # @param width [Integer] Image width.
      # @param height [Integer] Image height.
      # @param keyword [String, nil] A keyword to search by.
      # @return [String] An unsplash.com URL.
      #
      # @example
      #   Faker::Image.unsplash
      #     #=> https://source.unsplash.com/400x400
      # @example
      #   Faker::Image.unsplash(width: 900, height: 900)
      #     #=> https://source.unsplash.com/900x900
      #
      # @faker.version next
      def unsplash(category: nil, width: 400, height: 400, keyword: nil)
        url = 'https://source.unsplash.com'
        url += "/category/#{category}" unless category.nil?
        url += "/#{width}x#{height}"
        url += "?#{keyword}" unless keyword.nil?
        url
      end

      private

      def generate_placeholdit_color
        format('%06x', (rand * 0xffffff))
      end
    end
  end
end
