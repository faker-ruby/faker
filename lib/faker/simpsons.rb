module Faker
  class Simpsons < Base
    class << self
      def character
        characters.sample
      end

      def location
        locations.sample
      end

      def characters
        ['Homer Simpson', 'Bart Simpson', 'Marge Simpson', 'Mr. Burns', 'Lisa Simpson', 'Ned Flanders', 'Milhouse Van Houten', 'Moe Syzslak', 'Apu Nahasapeemapetilon', 'Barney Gumble',
         'Waylon Smithers', 'Edna Krabappel', 'Krusty the Clown', 'Patty Bouvier', 'Principal Skinner', 'Chief Wiggum', 'Hans Moleman', 'Ralph Wiggum', 'Comic Book Guy', 'Grampa Simpson', 'Troy McClure', 'Martin Prince',
         'Reverand Lovejoy', 'Nelson Muntz', 'Mayor Quimby', 'Kent Brockman', 'Miss Hoover', 'Dr. Hibbert', 'Groundskeeper Willie', 'Carl Carlson', 'Agnes Skinner', 'Todd Flanders', 'Max Power', ]
      end

      def locations
        ['Springfield Nuclear Power Plant', '742 Evergreen Terrace', 'Moes Tavern', 'Shelbyville', 'Springfield', 'Springfield Police Department', 'Krusty Burger', 'Capital City', 'The leftorium',
        'Springfield Tire Fire', 'Lard Lad Donuts', 'First Church of Springfield', 'Krustyland', 'Rancho Relaxo', '123 Fake Street', 'Springfield Gorge', 'Little Lisa Recycling Plant', 'Sprawl-Mart', 'Comic Book Store', 'Kwik-E-Mart']
      end
    end
  end
end
