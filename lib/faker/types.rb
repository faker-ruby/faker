module Faker
  class Types < Base
    CHARACTERS = ('0'..'9').to_a + ('a'..'z').to_a
    SIMPLE_TYPES = [:string, :fixnum]
    COMPLEX_TYPES = [:hash, :array]
    
    class << self
      def string(words=1)
        resolved_num = resolve(words)
        word_list = (
          translate('faker.lorem.words')
        )
        word_list = word_list * ((resolved_num / word_list.length) + 1)
        shuffle(word_list)[0, resolved_num].join(" ")
      end
      
      def character
        sample(CHARACTERS)
      end
      
      def integer(from=0, to=100)
        rand(from..to).to_i
      end
      
      def hash(key_count=1)
        Hash.new.tap do |hsh|
          key_count.times do
            hsh.merge!({self.string.to_sym => self.random_type})
          end
        end
      end
      
      def complex_hash(key_count=1)
        Hash.new.tap do |hsh|
          key_count.times do
            hsh.merge!({self.string.to_sym => self.random_complex_type})
          end
        end
      end
      
      def array(len=1)
        Array.new.tap do |ar|
          len.times do
            ar.push self.random_type
          end
        end
      end
      
      def random_type
        type_to_use = SIMPLE_TYPES[rand(0..SIMPLE_TYPES.length - 1)]
        case type_to_use
        when :string
          self.string
        when :fixnum
          self.integer
        else
          self.integer
        end
      end
      
      def random_complex_type
        types = SIMPLE_TYPES + COMPLEX_TYPES
        type_to_use = types[rand(0..types.length - 1)]
        case type_to_use
        when :string
          self.string
        when :fixnum
          self.integer
        when :hash
          self.hash
        when :array
          self.array
        else
          self.integer
        end
      end
      
      private
      
      def titleize(word)
        word.split(/(\W)/).map(&:capitalize).join
      end
      
      def resolve(value)
        case value
        when Array then sample(value)
        when Range then rand value
        else value
        end
      end
    end
  end
end
