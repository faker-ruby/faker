# frozen_string_literal: true

module Faker
  class Cosmere < Base
    flexible :cosmere
    class << self
      def aon
        sample(aons)
      end

      def shard_world
        sample(shard_worlds)
      end

      def shard
        sample(shards)
      end

      def surge
        sample(surges)
      end

      def knight_radiant
        sample(knights_radiant)
      end

      def metal
        sample(metals)
      end

      def allomancer
        sample(allomancers)
      end

      def feruchemist
        sample(feruchemists)
      end

      def herald
        sample(heralds)
      end

      def spren
        sample(sprens)
      end
    end
  end
end
