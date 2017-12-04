module Faker
  class University < Base
    flexible :university

    class << self
      def name
        parse('university.name')
      end

      def prefix
        fetch('university.prefix')
      end

      def suffix
        fetch('university.suffix')
      end

      def greek_organization
        organization = ''
        3.times { |_| organization += sample(greek_alphabet) }
        organization
      end

      def greek_alphabet
        ['Α', 'B', 'Γ', 'Δ', 'E', 'Z', 'H', 'Θ', 'I', 'K', 'Λ', 'M', 'N', 'Ξ',
         'O', 'Π', 'P', 'Σ', 'T', 'Y', 'Φ', 'X', 'Ψ', 'Ω']
      end
    end
  end
end
