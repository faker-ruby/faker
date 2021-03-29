# frozen_string_literal: true

module Faker
  class Wine < Base
    class << self
      # Produces a random wine varietal.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.varietal #=> "Chardonnay"
      #
      # @faker.version v2.17.0
      def varietal
        fetch('wine.varietal')
      end

      # Produces a random wine vintage.
      #
      # @return [Integer]
      #
      # @example
      #   Faker::Wine.vintage #=> 2019
      #
      # @faker.version v2.17.0
      def vintage
        rand_in_range(1990, ::Time.now.year - 1)
      end

      # Produces a random wine appellation.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.appellation #=> Central Coast
      #
      # @faker.version v2.17.0
      def appellation
        fetch('wine.appellations')
      end

      # Produces a random real wine corporation.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.corporation #=> Gallo
      #
      # @faker.version v2.17.0
      def corporation
        fetch('wine.corporations')
      end

      # Produces a random wine type.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.wine_type #=> Red
      #
      # @faker.version v2.17.0
      def wine_type
        fetch('wine.types')
      end

      # Produces a random wine brand.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.brand(real: true) #=> Caymus
      #   Faker::Wine.brand #=> Wisoky Family Estates
      #
      # @faker.version v2.17.0
      def brand(real: false)
        return fetch('wine.real_brands') if real

        "#{Faker::Name.last_name} #{fetch('wine.fake_brands.suffix')}"
      end

      # Produces a random wine label name.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.label #=> 2010 Wisoky Family Estates Cabernet Sauvignon
      #
      # @faker.version v2.17.0
      def label
        descriptor_on = sample([false, false, false, true])
        label_ary = [vintage, brand]
        label_ary << fetch('wine.fake_brands.descriptor') if descriptor_on
        label_ary << varietal
        label_ary.join(' ')
      end

      # Produces a random wine accolade.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.accolades(bad: true) #=> unfortunately disappoints and has a sniff of rotten eggs and continues on with overripe prunes that offends the senses.
      #   Faker::Wine.accolades #=> delights the nose with cinnamon and fills your mouth with fresh raspberries that leaves you satisfied
      #
      # @faker.version v2.17.0
      def accolade(bad: false)
        review_props = {}
        review_props[:visual_condition] = fetch('wine.wset.visual.condition')
        review_props[:smell_condition] = (bad ? fetch('wine.wset.smell.bad_condition') : fetch('wine.wset.smell.condition'))
        review_props[:taste_condition] = (bad ? fetch('wine.wset.taste.bad_condition') : fetch('wine.wset.taste.condition'))
        review_props[:fruit_condition] = (bad ? fetch('wine.wset.fruit.bad_condition') : fetch('wine.wset.fruit.condition'))
        review_props[:spice] = fetch('wine.wset.spice')
        review_props[:balance] = (bad ? fetch('wine.wset.bad_balance') : fetch('wine.wset.balance'))
        review_props[:vegetable] = fetch('wine.wset.vegetable')
        review_props[:finish] = (bad ? fetch('wine.accolades.bad_finish') : fetch('wine.accolades.good_finish'))
        review_props[:type] = wine_type
        case review_props[:type]
        when 'red'
          review_props[:visual_color] = fetch('wine.wset.visual.color.red')
          review_props[:smell_fruit] = fetch('wine.wset.fruit.red')
          review_props[:taste_fruit] = fetch('wine.wset.fruit.red')
          review_props[:oak] = fetch('wine.wset.oak.red')
        when 'rose'
          review_props[:visual_color] = fetch('wine.wset.visual.color.rose')
          review_props[:smell_fruit] = fetch('wine.wset.fruit.rose')
          review_props[:taste_fruit] = fetch('wine.wset.fruit.rose')
        else
          review_props[:visual_color] = fetch('wine.wset.visual.color.white')
          review_props[:smell_fruit] = fetch('wine.wset.fruit.white')
          review_props[:taste_fruit] = fetch('wine.wset.fruit.white')
          review_props[:oak] = fetch('wine.wset.oak.white')
        end
        accolade_ary = ["This #{review_props[:type]} wine"]
        accolade_ary << (bad ? fetch('wine.accolades.bad_intro') : fetch('wine.accolades.good_intro'))
        accolade_ary << (bad ? fetch('wine.accolades.bad_smell') : fetch('wine.accolades.good_smell'))
        accolade_ary << review_props[:smell_condition]
        accolade_ary << "#{review_props[:fruit_condition]} #{review_props[:smell_fruit]} and #{review_props[:spice]}."
        accolade_ary << 'The palette'
        accolade_ary << (bad ? fetch('wine.accolades.bad_palette') : fetch('wine.accolades.good_palette'))
        accolade_ary << review_props[:taste_condition]
        taste_ary = [review_props[:taste_fruit], review_props[:oak], review_props[:vegetable]]
        accolade_ary << "#{taste_ary.join(', ')}."
        accolade_ary << "Overall it is #{review_props[:balance]} and #{review_props[:finish]}."
        accolade_ary.join(' ')
      end

      # Produces a random wine score.
      #
      # @return [String]
      #
      # @example
      #   Faker::Wine.score(with_review_org: true) #=> Wine Spectator 85 pts
      #   Faker::Wine.score(with_review_person: true) #=> Jim Laube 92 pts
      #   Faker::Wine.score #=> 78 pts
      #
      # @faker.version v2.17.0
      def score(with_review_org: false, with_review_person: false)
        score_num = rand_in_range(70, 100)
        return "#{score_num} points, #{fetch('wine.accolades.company')}" if with_review_org

        return "#{score_num} points, #{fetch('wine.accolades.person')}" if with_review_person

        "#{score_num} points"
      end
    end
  end
end
