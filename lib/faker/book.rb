module Faker
  class Book < Base
    class << self
      def isbn_ten
        registration_group_element = rand(10).to_s
        registrant_element = (rand(90000) + 10000).to_s
        publication_element = (rand(900) + 100).to_s
        
        isbn_without_checksum = registration_group_element + registrant_element + publication_element
        isbn_without_checksum + calculate_checkdigit(isbn_without_checksum)
      end
      
      alias_method :isbn, :isbn_ten
      alias_method :asin, :isbn_ten
      
      private
      
      def calculate_checkdigit(raw_isbn)
        check_digit = 0
        i = 0
        raw_isbn.each_char do |letter|
          i+= 1
          letter = letter.to_i
          if i % 2 == 0
            check_digit += letter * 3
          else
            check_digit += letter
          end
        end
        rem = check_digit % 10
        if rem == 0
          check_digit = 0
        else
          check_digit = 10 - rem
        end
        check_digit.to_s
      end
    end
  end
end
