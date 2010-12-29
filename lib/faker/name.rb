module Faker
  class Name < Base
    class << self
      
      def name
        fetch('name.formats').collect {|meth| self.send(meth) }.join(' ')
      end
      
      def first_name; fetch('name.first_name'); end
      def last_name;  fetch('name.last_name'); end
      def prefix;     fetch('name.prefix'); end
      def suffix;     fetch('name.suffix'); end
      
    end
  end
end