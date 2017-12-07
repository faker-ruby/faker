module Faker
  class SemanticVersion < Base
    class << self
      def semantic_version(from_major = 0, to_major = 9, from_minor = 0, to_minor = 9, from_patch = 1, to_patch = 9)
        "#{random_inclusive(from_major, to_major)}.#{random_inclusive(from_minor, to_minor)}.#{random_inclusive(from_patch, to_patch)}"
      end

      def random_inclusive(min=1, max=9)
        (rand(max - min + 1) + min).to_s
      end
    end
  end
end
