module Faker
  class Identifier < Base
    flexible :identifier

    class << self

      def method_missing(name, *args, &block)
        result = send_to_locale_class name.to_sym
        result ||= numerify(fetch("identifier.#{name}"))
        result.nil? ? super : result
      end

    end
  end
end
