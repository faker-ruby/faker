module Faker
  class GameOfThrones < Base
    class << self
      def character
        characters.sample
      end

      def house
        houses.sample
      end

      def city
        cities.sample
      end

      def characters
        ['Daenerys Targaryen', 'Jon Snow', 'Arya Stark', 'Gregor Clegane', 'Melisandre', 'Tyrion Lannister', 'Jaime Lannister', 'Cersei Lannister', 'Petyr Baelish',
         'Jorah Mormont', 'Sansa Stark', 'Theon Greyjoy', 'Bran Stark', 'Sandor Clegane', 'Joffrey Baratheon', 'Catelyn Stark', 'Robb Stark', 'Ned Stark',
         'Robert Baratheon', 'Viserys Targaryen', 'Varys', 'Samwell Tarly', 'Bronn', 'Tywin Lannister', 'Jeor Mormont', 'Shae', 'Gendry', 'Tommen Baratheon', "Jaqen H'ghar",
         'Khal Drogo', 'Davos Seaworth', 'Margaery Tyrell', 'Stannis Baratheon', 'Ygritte', 'Brienne of Tarth', 'Roose Bolton', 'Ramsay Bolton']
      end

      def houses
        ['Arryn', 'Baratheon', 'Bolton', 'Frey', 'Greyjoy', 'Lannister', 'Martell', 'Stark', 'Targaryen', 'Tully', 'Tyrell']
      end

      def cities
        ['Braavos', "King's Landing", 'Volantis', 'Qarth', 'Asshai', 'Old Valyria', 'Meereen', 'Oldtown', 'Pentos', 'Astapor', 'Yunkai', 'Lorath', 'Lys', 'Vaes Dothrak',
         'Sunspear', 'White Harbor', 'Myr', 'Lannisport', 'Qohor', 'Tyrosh', 'Norvos', 'Gulltown', 'Old Ghis', 'New Ghis', 'Mantarys', 'Bayasabhad', 'Elyria', 'Tolos', 'Samyrian',
         'Chroyane', 'Tyria', 'Oros', 'Bhorash', 'Ny Sar', 'Sar Meel', 'Ar Noy']
      end
    end
  end
end
