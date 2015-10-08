module Faker
  class Mobile < Base
    class << self

      def imei(imei_salt = '')
        imei_base = imei_salt
        (14 - imei_base.size).times do
          imei_base << (0..9).to_a.sample.to_s
        end
        to_valid_luhn(imei_base)
      end

      def uicc(type = 'GSM')
        case type
          when /GSM/i
            temp_value = ('8901260' + rand.to_s[2..12])
          when /LTE/i
            temp_value = ('8901120' + rand.to_s[2..13])
          else
            fail 'Wrong type was provided [type: ' + type + ']'
        end
        to_valid_luhn(temp_value)
      end
      
      private

      def to_valid_luhn(number)
        sum = 0
        number.split(//).each_with_index.map do |x, i|
          y = x.to_i * (2 - ((i + 1) % 2))
          sum += (y < 10 ? y : y - 9)
        end
        sum % 10 == 0 ? "#{number}0" : "#{number}#{10 - (sum % 10)}"
      end

    end
  end
end