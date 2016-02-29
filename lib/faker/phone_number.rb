module Faker
  class PhoneNumber < Base
    class << self
      def phone_number
        if parse('phone_number.formats') == ""
          numerify(fetch('phone_number.formats'))
        else
          parse('phone_number.formats')
        end
      end

      def cell_phone
        if parse('cell_phone.formats') == ""
          numerify(fetch('cell_phone.formats'))
        else
          parse('cell_phone.formats')
        end
      end

      # US only
      def area_code
        begin
          fetch('phone_number.area_code')
        rescue I18n::MissingTranslationData
          nil
        end
      end

      # US only
      def exchange_code
        begin
          fetch('phone_number.exchange_code')
        rescue I18n::MissingTranslationData
          nil
        end
      end

      # US only
      # Can be used for both extensions and last four digits of phone number.
      # Since extensions can be of variable length, this method taks a length parameter
      def subscriber_number(length = 4)
        begin
          rand.to_s[2..(1 + length)]
        rescue I18n::MissingTranslationData
          nil
        end
      end

      alias_method :extension, :subscriber_number
    end
  end
end
