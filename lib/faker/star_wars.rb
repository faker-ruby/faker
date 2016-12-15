module Faker
  class StarWars < Base
    class << self
      def character
        characters.sample
      end

      def droid
        droids.sample
      end

      def planet
        planets.sample
      end

      def quote
        quotes.sample
      end

      def specie
        species.sample
      end

      def vehicle
        vehicles.sample
      end

      def wookie_sentence
        sentence = wookie_words.sample.capitalize

        rand(0..10).times { sentence += " " + wookie_words.sample}

        sentence + ['.','?','!'].sample
      end

      def characters
        ['Padme Amidala', 'Jar Jar Binks', 'Borvo the Hutt', 'Darth Caedus', 'Boba Fett', 'Jabba the Hutt', 'Obi-Wan Kenobi', 'Darth Maul', 'Leia Organa', 'Sheev Palpatine',
         'Kylo Ren', 'Darth Sidious', 'Anakin Skywalker', 'Luke Skywalker', 'Ben Solo', 'Han Solo', 'Darth Vader', 'Watto', 'Mace Windu', 'Yoda', 'Count Dooku', 'Sebulba',
         'Qui-Gon Jinn', 'Chewbacca', 'Jango Fett', 'Lando Calrissian', 'Bail Organa', 'Wedge Antilles', 'Poe Dameron', 'Ki-Adi-Mundi', 'Nute Gunray', 'Panaka', 'Rune Haako']
      end

      def droids
        ['2-1B', '4-LOM', 'ASP', 'B2-RP', 'B1', 'BD-3000', 'FA-4', 'GH-7', 'GNK', 'LM-432', 'ID9', '11-4D', '2-1B', '327-T', '4-LOM', 'B4-D4',
         'NR-N99', 'C-3PO', 'R2-D2', 'BB-8', 'R2-Q5']
      end

      def planets
        ['Alderaan', 'Bespin', 'Coruscant', 'DQar', 'Dagobah', 'Endor', 'Geonosis', 'Hoth',
          'Hosnian Prime',  'Jakku', 'Kamino', 'Kashyyyk', 'Lothal', 'Mustafar', 'Naboo',
          'Sullust', 'Takodana', 'Tatooine', 'Utapau', 'Yavin']
      end

      def quotes
        ["Never tell me the odds!", "Well, you said you wanted to be around when I made a mistake.", "You will never find a more wretched hive of scum and villainy. We must be cautious.", "Wars not make one great.",
         "You do have your moments. Not many, but you have them.", "Now, witness the power of this fully operational battle station.", "No reward is worth this.", "Shut him up or shut him down.",
         "I have a bad feeling about this.", "Who\'s the more foolish; the fool, or the fool who follows him?", "Would somebody get this big walking carpet out of my way?", "I find your lack of faith disturbing.",
         "If they follow standard Imperial procedure, they\'ll dump their garbage before they go to light-speed.", "Only at the end do you realize the power of the Dark Side.", "Bounty hunters! We don\'t need this scum.",
         "It\'s not impossible. I used to bullseye womp rats in my T-16 back home, they\'re not much bigger than two meters.", "Strike me down, and I will become more powerful than you could possibly imagine.",
         "You know, that little droid is going to cause me a lot of trouble.", "If you\'re saying that coming here was a bad idea, I\'m starting to agree with you.", "You\'ll find I\'m full of surprises!",
         "Aren\'t you a little short for a Stormtrooper?", "You are unwise to lower your defenses!", "R2-D2, you know better than to trust a strange computer!", "Truly wonderful, the mind of a child is.",
         "That is why you fail.", "A Jedi uses the Force for knowledge and defense, never for attack.", "Adventure. Excitement. A Jedi craves not these things.", "Judge me by my size, do you?",
         "Fear is the path to the dark side... fear leads to anger... anger leads to hate... hate leads to suffering.", "Do. Or do not. There is no try."]
      end

      def species
        ['Ewok', 'Hutt', 'Gungan', 'Ithorian', 'Jawa', 'Neimoidian', 'Sullustan', 'Wookiee', 'Mon Calamari']
      end

      def vehicles
        ['V-Wing Fighter', 'ATT Battle Tank', 'Naboo N-1 Starfighter', 'Vulture Droid', 'Republic Cruiser', 'Naboo Royal Starship', 'Gungan Bongo Submarine', 'Flash Speeder', 'Trade Federation Battleship', 'Millennium Falcon',
         'Sith Infiltrator', 'AT-ST Walker', 'TIE Bomber', 'Imperial Shuttle', 'Sandcrawler', 'TIE Interceptor', 'Speeder Bike', 'Death Star', 'AT-AT Walker', 'Imperial Star Destroyer', 'X-Wing Fighter']
      end

      def wookie_words
        ['wyaaaaaa', 'ruh', 'huewaa', 'muaa', 'mumwa', 'wua', 'ga', 'ma', 'ahuma', 'ooma', 'youw', 'kabukk', 'wyogg',
          'gwyaaaag', 'roooarrgh', 'ur', 'ru', 'roo', 'hnn-rowr', 'yrroonn', 'nng', 'rarr']
      end
    end
  end
end
