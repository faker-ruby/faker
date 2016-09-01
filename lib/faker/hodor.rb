# encoding: utf-8
module Faker
  class Hodor < Lorem
    class << self

      def word
        translate('faker.hodor')
      end

      def words(num = 3, supplemental = false)
        resolved_num = resolve(num)
        word_list = (
        [translate('faker.hodor')] +
            (supplemental ? [translate('faker.hodor')] : [])
        )
        word_list = word_list * ((resolved_num / word_list.length) + 1)
        word_list.shuffle[0, resolved_num]
      end

      def characters(char_count = 255)
        return '' if char_count.respond_to?(:to_i) && char_count.to_i < 1
        char_count = resolve(char_count)
        hodor_chars = translate('faker.hodor').split('')
        characters = ''
        char_count.times { |i| characters.concat hodor_chars[i%hodor_chars.length] }
        characters
      end
    end
  end
end
