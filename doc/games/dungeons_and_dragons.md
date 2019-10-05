# Faker::Games::DungeonsAndDragons

Available as of version `next`.

```ruby
Faker::Games::DungeonsAndDragons.ability #=> "Dexterity"

# Returns a corresponding skill if passed a valid ability, or a random skill
# if no parameter is given.
Faker::Games::DungeonsAndDragons.skill #=> "History"
Faker::Games::DungeonsAndDragons.skill(ability: "wisdom") #=> "Perception"

Faker::Games::DungeonsAndDragons.alignment #=> "Chaotic Good"

Faker::Games::DungeonsAndDragons.armor #=> "Leather Armor"

Faker::Games::DungeonsAndDragons.player_class #=> "Paladin"

# Returns a corresponding subclass if passed a valid class, or a random subclass
# if no parameter is given.
Faker::Games::DungeonsAndDragons.subclass #=> "Champion"
Faker::Games::DungeonsAndDragons.subclass(player_class: "rogue") #=> "Thief"

Faker::Games::DungeonsAndDragons.language #=> "Elvish"

Faker::Games::DungeonsAndDragons.monster #=> "Ancient Red Dragon"

Faker::Games::DungeonsAndDragons.race #=> "Dwarf"

# Returns a corresponding subrace if passed a valid race, or a random subrace
# if no parameter is given.
Faker::Games::DungeonsAndDragons.subrace #=> "High Elf"
Faker::Games::DungeonsAndDragons.subrace(race: "dwarf") #=> "Hill Dwarf"

Faker::Games::DungeonsAndDragons.spell #=> "Fireball"

Faker::Games::DungeonsAndDragons.magic_school #=> "Illusion"

Faker::Games::DungeonsAndDragons.weapon #=> "Battleaxe"

Faker::Games::DungeonsAndDragons.magic_item #=> "Deck of Many Things"
```
