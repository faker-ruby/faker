# frozen_string_literal: true

module Faker
  class Creature
    class Bird < Base
      flexible :bird

      class << self
        ##
        # Produces a random common family name of a bird
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.common_family_name #=> "Owls"
        #
        # @faker.version 2.16.0
        def common_family_name
          fetch('creature.bird.common_family_name')
        end

        ##
        # Produces a random common taxonomic order from the class Aves
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.order #=> "Passeriformes"
        #
        # @faker.version 2.16.0
        def order
          fetch('creature.bird.order')
        end

        ##
        # Produces a random bird anatomy word
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.anatomy #=> "rump"
        #
        # @faker.version 2.16.0
        def anatomy
          fetch('creature.bird.anatomy')
        end

        ##
        # Produces a random, past tensed bird anatomy word
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.anatomy #=> "breasted"
        #
        # @faker.version 2.16.0
        def anatomy_past_tense
          fetch('creature.bird.anatomy_past_tense')
        end

        ##
        # Produces a random geographical word used in describing birds
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.geo #=> "Eurasian"
        #
        # @faker.version 2.16.0
        def geo
          fetch('creature.bird.geo')
        end

        ##
        # Produces a random color word used in describing birds
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.color #=> "ferruginous"
        #
        # @faker.version 2.16.0
        def color
          fetch('creature.bird.colors')
        end

        ##
        # Produces a random adjective used to described birds
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.adjective #=> 'common'
        #
        # @faker.version 2.16.0
        def adjective
          fetch('creature.bird.adjectives')
        end

        ##
        # Produces a random emotional adjective NOT used to described birds
        # ...but could be
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.emotional_adjective #=> 'cantankerous'
        #
        # @faker.version 2.16.0
        def emotional_adjective
          fetch('creature.bird.emotional_adjectives')
        end

        ##
        # Produces a random adjective NOT used to described birds
        # ...but probably shouldn't
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.silly_adjective #=> 'drunk'
        #
        # @faker.version 2.16.0
        def silly_adjective
          fetch('creature.bird.silly_adjectives')
        end

        ##
        # Produces a random common name for a bird
        #
        # @return [String]
        #
        # @example
        #   Faker::Creature::Bird.common_name #=> 'Wren'
        #
        # @faker.version 2.16.0
        def common_name
          fetch('creature.bird.common_names')
        end
      end
    end
  end
end
