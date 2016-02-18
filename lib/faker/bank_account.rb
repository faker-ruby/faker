module Faker
  class BankAccount < Base
    class << self
      def routing_number(fraction_note=false)
        if fraction_note
          compile_fraction(valid_routing_number)
        else
          valid_routing_number
        end
      end

      def account_number
        # return 10 digit number
      end

      def iban
        # ??
      end

      def swift

      end

      def insitution_name

      end

      private

      def checksum(num_string)
        num_array = num_string.split('').map(&:to_i)
        digit = (7 * (num_array[0] + num_array[3] + num_array[6]) + 3 * (num_array[1] + num_array[4] + num_array[7]) + 9 * (num_array[2] + num_array[5])) % 10
        return digit == num_array[8]
      end

      def compile_routing_number
        digit_one_two = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
        ((21..32).to_a + (61..72).to_a + [80]).each { |x| digit_one_two << x.to_s }
        routing_num = digit_one_two.sample + rand_numstring + rand_numstring + rand_numstring + rand_numstring + rand_numstring + rand_numstring + rand_numstring
        return routing_num
      end

      def valid_routing_number
        for i in 0..500000
          micr = compile_routing_number
          if checksum(micr)
            break
          end
        end
        return micr
      end

      def compile_fraction(routing_num)
        prefix = (1..50).to_a.map(&:to_s).sample
        numerator = routing_num.split('')[5..8].join.to_i.to_s
        denominator = routing_num.split('')[0..4].join.to_i.to_s
        return prefix + '-' + numerator + '/' + denominator 
      end

      def rand_numstring
        return (0..9).to_a.map(&:to_s).sample
      end
    end
  end
end


# Faker::BankAccount.routing_number
# # => '1291131673'
# Faker::BankAccount.routing_number(true) # true to use the rare "fraction" notation
# # => '11-3167/1210'
# Faker::BankAccount.account_number
# # => '0114584906'
# Faker::BankAccount.iban
# # => 'GR16 0110 1250 0000 0001 2300 695'
# Faker::BankAccount.swift
# # => 'DEUTDFF'
# Faker::BankAccount.institution_name
# # => 'Ontario Agriculture Bank'
# # => 'First Bank of Osaka'
# # => 'Commerce Bank of Stockholm'
# # => 'Great American Sperm Bank'