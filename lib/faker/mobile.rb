module Faker
  class Mobile < Base
    class << self


      # meid - 14 hex -
      # imei - 14 + 1 - checksum

      def imei(imei_salt = '')
        luhn_checksum(meid(imei_salt))
      end

      def meid(meid_salt = '')
        (14 - meid_salt.size).times do
          meid_salt << (0..9).to_a.sample.to_s
        end
        meid_salt
      end


      def esn(type = nil)
        case type
          when 'active', :active
            esn_salt = 'BE'
          when 'unsupported', :unsupported
            esn_salt = 'DD'
          when 'stolen', :stolen
            esn_salt = 'FF'
          else
            esn_salt = ''
        end
        esn_salt << Digest::MD5.hexdigest(DateTime.now.to_i.to_s).to_s[0, 8 - esn_salt.size]
        esn_salt
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
        luhn_checksum(temp_value)
      end

      private

      def luhn_checksum(number)
        sum = 0
        number.split(//).reverse.each_with_index.map do |x, i|
          y = x.to_i * (2 - (i % 2))
          sum += (y < 10 ? y : y - 9)
        end
        check = sum % 10
        check == 0 ? "#{number}0" : "#{number}#{10 - check}"
      end
    end
  end
end
