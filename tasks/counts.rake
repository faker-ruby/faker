require 'yaml'

main = YAML.load_file('lib/locales/en.yml')
dr_who = YAML.load_file('lib/locales/en/dr_who.yml')
rick_and_morty = YAML.load_file('lib/locales/en/rick_and_morty.yml')

def counts(file, type)
  faker = file["en"]["faker"][type]
  faker.each do |key, value|
    puts "#{type} #{key}: #{value.length} elements"
  end
end

counts(main, "ancient")
counts(main, "business")
counts(main, "cat")
counts(main, "chuck_norris")
counts(main, "demographic")
counts(main,"dessert")
counts(dr_who, "dr_who")
counts(main, "dragon_ball")
counts(main, "file")
counts(main, "food")
counts(main, "friends")
counts(main, "game_of_thrones")
counts(main, "harry_potter")
counts(main, "hey_arnold")
counts(main, "hitchhikers_guide_to_the_galaxy")
counts(main, "hobbit")
counts(main, "how_i_met_your_mother")
counts(main, "league_of_legends")
counts(main, "lord_of_the_rings")
counts(main, "matz")
counts(main, "overwatch")
counts(main, "pokemon")
counts(rick_and_morty, "rick_and_morty")
counts(main, "robin")
counts(main, "rock_band")
counts(main, "simpsons")
counts(main, "space")
counts(main, "star_trek")
counts(main, "twin_peaks")
counts(main, "zelda")
