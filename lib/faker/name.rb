module Faker
  class Name < Base
    flexible :name

    class << self
      
      def name
        parse('name.name')
      end
      
      # In most western languages, first name is just a single "word". However, in some languages such as Chinese or
      # Japanese, first name is composed of different combination of single word instead of alphabet.
      def first_name; parse('name.first_name'); end
      def last_name;  fetch('name.last_name'); end
      def prefix;     fetch('name.prefix'); end
      def suffix;     fetch('name.suffix'); end
      
      # Generate a buzzword-laden job title
      # Wordlist from http://www.bullshitjob.com/title/
      def title; fetch('name.title.descriptor') + ' ' + fetch('name.title.level') + ' ' + fetch('name.title.job'); end
      
    end
  end
end
