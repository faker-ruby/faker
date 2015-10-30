module Faker
  module LocaleSwitcher
    def self.switch(type)
      switched_locale = Faker::Config.locale
      case type
      when :internet
        if Faker::Config.locale == :"zh-TW"
          switched_locale = :en
        end
      end
      switched_locale
    end
  end
end
