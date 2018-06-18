module Faker
  class Name < Base
    flexible :name

    class << self
      extend Gem::Deprecate

      def name
        parse('name.name')
      end

      def name_with_middle
        parse('name.name_with_middle')
      end

      def first_name
        parse('name.first_name')
      end

      def last_name
        parse('name.last_name')
      end

      def prefix
        fetch('name.prefix')
      end

      def suffix
        fetch('name.suffix')
      end

      def title
        Faker::Job.title
      end

      def initials(character_count = 3)
        (0...character_count).map { rand(65..90).chr }.join
      end

      def job_titles
        fetch_all('job.position')
      end

      deprecate :title, 'Faker::Job.title', 2018, 9
      deprecate :job_titles, :none, 2018, 9
    end
  end
end
