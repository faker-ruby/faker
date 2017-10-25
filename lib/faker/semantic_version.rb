module Faker
  class SemanticVersion < Base
    class << self

      def version(major=nil, minor=nil, patch=nil, meta=false)
        major ||= rand(10)
        minor ||= rand(10)
        patch ||= rand(20)
        metadata = ''
        if meta
          metadata = "-#{fetch('semantic_version.meta')}-#{rand(50000)}"
        end
        "#{major}.#{minor}.#{patch}#{metadata}"
      end

    end
  end
end
