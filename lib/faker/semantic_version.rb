module Faker
  class SemanticVersion < Base
    class << self

      def version(major = nil, minor = nil, patch = nil, include_meta = false)
        major ||= rand(0..10)
        minor ||= rand(0..20)
        patch ||= rand(0..20)
        metadata = ''
        if include_meta
          details = rand(50000)
          metadata = "-#{fetch('semantic_version.meta')}-#{details}"
        end
        "#{major}.#{minor}.#{patch}#{metadata}"
      end
      
    end
  end
end