module Faker
  class Country
    attr_reader :short_name, :tld, :iso_3166_1_alpha2

    def initialize(attributes)
      attr = attributes.symbolize_keys
      @short_name = attr[:short_name]
      @official_name = attr[:official_name]
      @sortable_name = attr[:sortable_name]
      @tld = attr[:tld]
      @iso_3166_1_alpha2 = attr[:iso_3166_1_alpha2]
      @demonym = attr[:demonym]
      recursively(@demonym, :symbolize_keys!) if @demonym.kind_of? Hash
    end

    def official_name() @official_name || short_name end
    def sortable_name() @sortable_name || short_name end

    def demonym(options={})
      demo = options[:demonym] || @demonym
      case demo
        when String
          demo
        when Array
          options[:all] ? demo.dup : demo.first
        when Hash
          if [ :male, :female ].all? { |key| demo.key? key } then
            if demo.key?(options[:gender]) then
              demonym options.merge(:demonym => demo[options[:gender]])
            else
              demonym options.merge(:demonym => demo[:male])
            end
          end
      end
    end

    def inspect
      "#<#{self.class.to_s} #{short_name}>"
    end

    class << self
      def country(include_partially_recognized=false)
        (include_partially_recognized ? (countries + partially_recognized_countries) : countries).sample
      end

      def country_for_code(iso_3166_1_alpha2)
        (countries + partially_recognized_countries).detect { |c| c.iso_3166_1_alpha2 == iso_3166_1_alpha2 }
      end

      def countries
        @countries ||= I18n.translate('faker.country_by_code').map { |code, hash| Faker::Country.new(hash) }
      end

      def partially_recognized_countries
        @pr_countries ||= I18n.translate('faker.partially_recognized_country').map { |hash| Faker::Country.new(hash) }
      end
    end

    private
      def recursively(obj, meth=nil)
        raise ArgumentError, "Must pass a method name or a block" unless block_given? or meth
        meth ? obj.send(meth) : yield(obj)
        obj.each { |key, value| obj[key] = recursively(value, meth) if value.respond_to?(meth) }
        self
      end
  end
end
