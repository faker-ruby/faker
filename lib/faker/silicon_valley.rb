module Faker
  class SiliconValley < Base
    class << self
      def character
        sample(characters)
      end

      def company
        sample(companies)
      end

      def quote
        sample(quotes)
      end

      def characters
        ['Richard Hendricks', 'Erlich Bachman', 'Nelson « Big Head » Bighetti',
         'Bertram Gilfoyle', 'Dinesh Chugtai', 'Donald « Jared » Dunn',
         'Monica Hall', 'Gavin Belson', 'Laurie Bream', 'Peter Gregory',
         'Jian-Yang', 'Jack Barker', 'Russ Hanneman', 'Ron LaFlamme',
         'Denpok', 'Pete Monahan']
      end

      def companies
        ['Pied Piper', 'Hooli', 'Raviga Capital', 'End Frame', 'Bachmanity']
      end

      def quotes
        ["I got a spot on my pants, kind of like I pissed myself like a big baby.",
         "What\'s happening? I\'m sorry, what? Mr. Car?",
         "You just brought piss to a sh*t fight!",
         "Your muffins smell like s**t and so do your ideas.",
         "One of you is one of the least attractive people I\'ve ever met and I\'m not going to say which one.",
         "Your logo looks like a sideways vagina. I find that to be racist. Don't you?",
         "It looks like a guy sucking a dick, with another dick tucked behind his ear for later. Like a snack dick.",
         "We have to act like any animal that\'s been cornered, acting erratically and blindly lashing out at anything around us",
         "I don\'t know about you people, but I don\'t want to live in a world where someone else makes the world a better place better than we do.",
         "What? Revenue? No, no, no, no, no. No."]
      end
    end
  end
end
