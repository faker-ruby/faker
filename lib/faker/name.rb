module Faker
  class Name < Base
    class << self
      
      def name
        I18n.translate('name.formats').rand.collect {|meth| self.send(meth) }.join(' ')
      end
      
      # defines methods first_name, last_name, prefix, suffix
      (I18n.translate(:name).keys - [:formats]).each do |meth|
        define_method(meth) do
          I18n.translate("name.#{meth}").rand
        end
      end      

    end
  end
end