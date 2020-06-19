# frozen_string_literal: true

module Faker
  class Games
    class Minecraft < Base
      class << self
        ##
        # Produces the name of a block from Minecraft.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Minecraft.block #=> "Stone"
        #
        # @faker.version next
        def block
          fetch('games.minecraft.blocks')
        end

        ##
        # Produces the name of an item from Minecraft.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Minecraft.item #=> "Iron Shovel"
        #
        # @faker.version next
        def item
          fetch('games.minecraft.items')
        end

        ##
        # Produces the name of a mob from Minecraft.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Minecraft.item #=> "Sheep"
        #
        # @faker.version next
        def mob
          fetch('games.minecraft.mobs')
        end
      end
    end
  end
end
