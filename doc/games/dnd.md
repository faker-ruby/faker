# Faker::Games::DnD

```ruby
Faker::Games::DnD.ability #=> "Dexterity"

# Returns a corresponding skill if passed a valid ability, or a random skill
# if no parameter is given.
Faker::Games::DnD.skill #=> "History"
Faker::Games::DnD.skill(ability: "wisdom") #=> "Perception"

Faker::Games::DnD.alignment #=> "Lawful Neutral"

Faker::Games::DnD.armor #=> "Leather Armor"

Faker::Games::DnD.background #=> "Urchin"

Faker::Games::DnD.city #=> "Earthfast"

Faker::Games::DnD.klass #=> "Warlock"

# Returns a corresponding subclass if passed a valid class, or a random subclass
# if no parameter is given.
Faker::Games::DnD.subclass #=> "Champion"
Faker::Games::DnD.subclass(klass: "rogue") #=> "Thief"

Faker::Games::DnD.language #=> "Gnomish"

Faker::Games::DnD.melee_weapon #=> "Handaxe"

Faker::Games::DnD.monster #=> "Manticore"

Faker::Games::DnD.race #=> "Dwarf"

# Returns a corresponding subrace if passed a valid race, or a random subrace
# if no parameter is given.
Faker::Games::DnD.subrace #=> "High Elf"
Faker::Games::DnD.subrace(race: "dwarf") #=> "Hill Dwarf"

Faker::Games::DnD.ranged_weapon #=> "Shortbow"

Faker::Games::DnD.spell #=> "Fireball"

Faker::Games::DnD.magic_school #=> "Illusion"

Faker::Games::DnD.magic_item #=> "Deck of Many Things"
```