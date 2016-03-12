module Faker
  class Wine < Base
    flexible :wine

    class << self
      def varietal
        fetch('wine.varietal')
      end

      def vintage
        rand(1960..2016).to_s
      end

      def new_vintage
        rand(2006..2016).to_s
      end

      def old_vintage
        rand(1960..2006).to_s
      end

      def appellation
        fetch('wine.appellation')
      end

      def producer
        fetch('wine.producer')
      end

      def note
        fetch('wine.note')
      end

      def process
        fetch('wine.process')
      end

      def process_description
        process_templates.sample
      end

      def process_templates
        [
          "This wine spends 6 months #{process} followed by a year #{process}.",
          "After a year #{process}, the wine is matured for 2 years #{process}.",
          "Following 9 months #{process}, the wine is racked and allowed to rest #{process} for 15 months.",
          "The winemaker finishes half of the wine #{process} and the other half #{process}.",
          "Once the wine has matured for 15 months #{process}, it is hand bottled on the estate.",
          "Traditionally this wine spends up to 8 months #{process} and then 14 months #{process}.",
          "Following strict appellation regulations, the wine spends a minimum of 18 months #{process} before being bottled."
        ]
      end

      def publication
        fetch('wine.publication')
      end

      def points
        rand(80..100).to_s
      end

      def rating
        "Rated #{points} points by #{publication}"
      end

      def name
        name_templates.sample
      end

      def nickname
        fetch('wine.nickname')
      end

      def name_templates
        [
          "#{producer} #{varietal} - #{new_vintage}",
          "#{producer} #{varietal} - #{old_vintage}",
          "#{producer}, #{nickname}, #{varietal} - #{new_vintage}",
          "#{producer} #{varietal} - NV",
          "#{appellation} #{varietal} - #{new_vintage}"
        ]
      end

      def adjective
        fetch('wine.adjective')
      end

      def description
        description_templates.sample
      end

      def description_templates
        [
          "This wine is #{adjective} with notes of #{note}, #{note}, and #{note}, with a #{adjective} finish.",
          "A reserved, yet #{adjective} expression of the style with #{note} on the nose.",
          "With hints of #{note}, #{adjective} acidity, and #{adjective} tannins, this wine is sure to please lovers of #{varietal}.",
          "Both #{adjective} and #{adjective}, a tasty treat for any day.",
          "With #{adjective} acidity, and #{adjective} tannins, this wine is ready to drink now and cellarable for years to come.",
          "This undeniably #{adjective} wine will both delight and surprise even the most discerning palate.",
          "A #{note} bomb from one of the hottest new winemakers on the scene.",
          "Notes of #{note} and #{note} give way to a #{adjective} finish.",
          "Medium-bodied with #{adjective} acid and a distinctive nose of #{note}.",
          "Full-bodied with #{adjective} acid and #{adjective} tannins."
        ]
      end

      def snob
        snob_templates.sample
      end

      def snob_templates
        [
          "I detect a hint of #{note}.",
          "I don't want to sound like a wine snob.",
          "If it's not a single vineyard #{varietal}, it's not worth drinking.",
          "I love Sideways.",
          "I hate Sideways.",
          "#{new_vintage} was a good year for #{appellation}.",
          "To be honest, #{varietal} from #{appellation} is not my favorite.",
          "#{publication} gave it #{points} points.",
          "I don't really trust #{publication} ratings.",
          "The terroir really comes through with the notes of #{note} and #{note}.",
          "I toured through #{appellation} on my last vacation.",
          "I only drink #{varietal} from #{appellation}.",
          "I don't drink anything younger than #{old_vintage}.",
          "Although the wine is #{adjective}, I think it could use a few more years in the cellar.",
          "I think this would pair well with #{food}."
        ]
      end

      def food
        fetch('wine.food')
      end

      def pairing
        "Pairs well with #{food}."
      end
    end
  end
end
