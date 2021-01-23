# typed: strong
# :nodoc:
module Faker
  module Config
    class << self
      sig { returns(T.untyped) }
      attr_accessor :locale

      sig { returns(T.untyped) }
      attr_accessor :random
    end

    sig { returns(T.untyped) }
    def self.own_locale; end
  end

  class Base
    # by default numerify results do not start with a zero
    sig { params(number_string: T.untyped, leading_zero: T.untyped).returns(T.untyped) }
    def self.numerify(number_string, leading_zero: false); end

    sig { params(letter_string: T.untyped).returns(T.untyped) }
    def self.letterify(letter_string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.bothify(string); end

    # Given a regular expression, attempt to generate a string
    # that would match it.  This is a rather simple implementation,
    # so don't be shocked if it blows up on you in a spectacular fashion.
    # 
    # It does not handle ., *, unbounded ranges such as {1,},
    # extensions such as (?=), character classes, some abbreviations
    # for character classes, and nested parentheses.
    # 
    # I told you it was simple. :) It's also probably dog-slow,
    # so you shouldn't use it.
    # 
    # It will take a regex like this:
    # 
    # /^[A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}$/
    # 
    # and generate a string like this:
    # 
    # "U3V  3TP"
    sig { params(reg: T.untyped).returns(T.untyped) }
    def self.regexify(reg); end

    # Helper for the common approach of grabbing a translation
    # with an array of values and selecting one of them.
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.fetch(key); end

    # Helper for the common approach of grabbing a translation
    # with an array of values and returning all of them.
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.fetch_all(key); end

    # Load formatted strings from the locale, "parsing" them
    # into method calls that can be used to generate a
    # formatted translation: e.g., "#{first_name} #{last_name}".
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.parse(key); end

    # Call I18n.translate with our configured locale if no
    # locale is specified
    sig { params(args: T.untyped, opts: T.untyped).returns(T.untyped) }
    def self.translate(*args, **opts); end

    # Executes block with given locale set.
    sig { params(tmp_locale: T.untyped, block: T.untyped).returns(T.untyped) }
    def self.with_locale(tmp_locale = nil, &block); end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self.flexible(key); end

    # You can add whatever you want to the locale file, and it will get caught here.
    # E.g., in your locale file, create a
    #   name:
    #     girls_name: ["Alice", "Cheryl", "Tatiana"]
    # Then you can call Faker::Name.girls_name and it will act like #first_name
    sig { params(mth: T.untyped, args: T.untyped, block: T.untyped).returns(T.untyped) }
    def self.method_missing(mth, *args, &block); end

    sig { params(method_name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
    def self.respond_to_missing?(method_name, include_private = false); end

    # Generates a random value between the interval
    sig { params(from: T.untyped, to: T.untyped).returns(T.untyped) }
    def self.rand_in_range(from, to); end

    # If an array or range is passed, a random value will be selected.
    # All other values are simply returned.
    sig { params(value: T.untyped).returns(T.untyped) }
    def self.resolve(value); end

    # Return unique values from the generator every time.
    # 
    # _@param_ `max_retries` — The max number of retries that should be done before giving up.
    sig { params(max_retries: Integer).returns(T.self_type) }
    def self.unique(max_retries = 10_000); end

    sig { params(list: T.untyped, num: T.untyped).returns(T.untyped) }
    def self.sample(list, num = nil); end

    sig { params(list: T.untyped).returns(T.untyped) }
    def self.shuffle(list); end

    sig { params(max: T.untyped).returns(T.untyped) }
    def self.rand(max = nil); end

    sig { returns(T.untyped) }
    def self.disable_enforce_available_locales; end

    sig { returns(T.untyped) }
    def self.warn_for_deprecated_arguments; end

    # Workaround for emulating `warn '...', uplevel: 1` in Ruby 2.4 or lower.
    sig { params(message: T.untyped, uplevel: T.untyped).returns(T.untyped) }
    def self.warn_with_uplevel(message, uplevel: 1); end

    sig { params(at: T.untyped).returns(T.untyped) }
    def self.parse_caller(at); end
  end

  module Char
    sig { params(string: T.untyped).returns(T.untyped) }
    def self.prepare(string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.fix_umlauts(string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.romanize_cyrillic(string); end
  end

  module Base58
    sig { params(str: T.untyped).returns(T.untyped) }
    def self.encode(str); end
  end

  class Games
    class DnD < Faker::Base
      # Produces the name of an alignment from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.alignment #=> "Lawful Neutral"
      # ```
      sig { returns(::String) }
      def self.alignment; end

      # Produces the name of a background from Dungeons and Dragons (PHB).
      # 
      # ```ruby
      # Faker::Games::DnD.background #=> "Urchin"
      # ```
      sig { returns(::String) }
      def self.background; end

      # Produces the name of a city from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.city #=> "Earthfast"
      # ```
      sig { returns(::String) }
      def self.city; end

      # Produces the name of a class from Dungeons and Dragons (PHB).
      # 
      # ```ruby
      # Faker::Games::DnD.klass #=> "Warlock"
      # ```
      sig { returns(::String) }
      def self.klass; end

      # Produces the name of a language from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.language #=> "Gnomish"
      # ```
      sig { returns(::String) }
      def self.language; end

      # Produces the name of a melee weapon from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.melee_weapon #=> "Handaxe"
      # ```
      sig { returns(::String) }
      def self.melee_weapon; end

      # Produces the name of a monster from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.monster #=> "Manticore"
      # ```
      sig { returns(::String) }
      def self.monster; end

      # Produces the name of a race from Dungeons and Dragons (PHB).
      # 
      # ```ruby
      # Faker::Games::DnD.races #=> "Dwarf"
      # ```
      sig { returns(::String) }
      def self.race; end

      # Produces the name of a ranged weapon from Dungeons and Dragons.
      # 
      # ```ruby
      # Faker::Games::DnD.ranged_weapon #=> "Shortbow"
      # ```
      sig { returns(::String) }
      def self.ranged_weapon; end

      # This method is deprecated. The implementation will be removed in a near future release.
      # Use `DnD.race` instead.
      # 
      # _@deprecated_ — Use {#race} instead.
      sig { returns(T.untyped) }
      def self.species; end
    end

    class Dota < Faker::Base
      # Produces the name of a hero from Dota.
      # 
      # ```ruby
      # Faker::Games::Dota.hero #=> "Abaddon"
      # ```
      sig { returns(::String) }
      def self.hero; end

      # Produces the name of an item from Dota.
      # 
      # ```ruby
      # Faker::Games::Dota.item #=> "Armlet of Mordiggian"
      # ```
      sig { returns(::String) }
      def self.item; end

      # Produces the name of a professional Dota team.
      # 
      # ```ruby
      # Faker::Games::Dota.team #=> "Evil Geniuses"
      # ```
      sig { returns(::String) }
      def self.team; end

      # Produces the name of a professional Dota player.
      # 
      # ```ruby
      # Faker::Games::Dota.player #=> "Dendi"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of a hero from Dota.
      # 
      # _@param_ `hero` — The name of a Dota hero.
      # 
      # ```ruby
      # Faker::Games::Dota.quote #=> "You have called death upon yourself."
      # Faker::Games::Dota.quote(hero: 'alchemist') #=> "Better living through alchemy!"
      # ```
      sig { params(legacy_hero: T.untyped, hero: ::String).returns(::String) }
      def self.quote(legacy_hero = T.unsafe(nil), hero: 'abaddon'); end
    end

    class Myst < Faker::Base
      # Produces the name of a game from the Myst series.
      # 
      # ```ruby
      # Faker::Games::Myst.game #=> "Myst III: Exile"
      # ```
      sig { returns(::String) }
      def self.game; end

      # Produces the name of a creature from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.creature #=> "squee"
      # ```
      sig { returns(::String) }
      def self.creature; end

      # Produces the name of an age from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.age #=> "Relto"
      # ```
      sig { returns(::String) }
      def self.age; end

      # Produces the name of a chracter from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.character #=> "Gehn"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.quote #=> "I realized, the moment I fell into the fissure, that the Book would not be destroyed as I had planned."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Zelda < Faker::Base
      # Produces the name of a Legend of Zelda game.
      # 
      # ```ruby
      # Faker::Games::Zelda.game #=> "Breath of the Wild"
      # ```
      sig { returns(::String) }
      def self.game; end

      # Produces the name of a character from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.character #=> "Link"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a character from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.location #=> "Hyrule Castle"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces the name of an item from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.item #=> "Boomerang"
      # ```
      sig { returns(::String) }
      def self.item; end
    end

    class Heroes < Faker::Base
      # Produces the name of a hero from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.name #=> "Christian"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces the name of a specialty from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.specialty #=> "Ballista"
      # ```
      sig { returns(::String) }
      def self.specialty; end

      # Produces the name of a class from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.klass #=> "Knight"
      # ```
      sig { returns(::String) }
      def self.klass; end

      # Produces the name of an artifact from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.artifact #=> "Armageddon's Blade"
      # ```
      sig { returns(::String) }
      def self.artifact; end
    end

    class Touhou < Faker::Base
      # Produces the name of a Touhou game.
      # 
      # ```ruby
      # Faker::Games::Touhou.game #=> "Mountain of Faith"
      # ```
      sig { returns(::String) }
      def self.game; end

      # Produces the name of a character from the Touhou games.
      # 
      # ```ruby
      # Faker::Games::Touhou.character #=> "Sanae Kochiya"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a location from the Touhou games.
      # 
      # ```ruby
      # Faker::Games::Touhou.location #=> "Moriya Shrine"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces the name of a spell card from the Touhou games.
      # 
      # ```ruby
      # Faker::Games::Touhou.spell_card #=> 'Esoterica "Gray Thaumaturgy"'
      # ```
      sig { returns(::String) }
      def self.spell_card; end

      # Produces the name of a song from the Touhou games.
      # 
      # ```ruby
      # Faker::Games::Touhou.song #=> "Faith Is for the Transient People"
      # ```
      sig { returns(::String) }
      def self.song; end
    end

    class Control < Faker::Base
      # Produces the name of a character from Control.
      # 
      # ```ruby
      # Faker::Games::Control.character #=> "Jesse Faden"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a location from Control.
      # 
      # ```ruby
      # Faker::Games::Control.location #=> "Dimensional Research"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces the name of an Object of Power (OoP)
      # 
      # ```ruby
      # Faker::Games::Control.object_of_power #=> "Hotline"
      # ```
      sig { returns(::String) }
      def self.object_of_power; end

      # Produces the name of an Altered Item
      # 
      # ```ruby
      # Faker::Games::Control.altered_item #=> "Rubber Duck"
      # ```
      sig { returns(::String) }
      def self.altered_item; end

      # Produces the location of an Altered World Event (AWE)
      # 
      # ```ruby
      # Faker::Games::Control.altered_world_event #=> "Ordinary, Wisconsin"
      # ```
      sig { returns(::String) }
      def self.altered_world_event; end

      # Produces a line from the Hiss incantation
      # 
      # ```ruby
      # Faker::Games::Control.hiss #=> "Push the fingers through the surface into the wet."
      # ```
      sig { returns(::String) }
      def self.hiss; end

      # < Produces a line/quote/message from The Board >
      # 
      # ```ruby
      # Faker::Games::Control.the_board #=> "< You/We wield the Gun/You. The Board appoints you. Congratulations, Director. >"
      # ```
      sig { returns(::String) }
      def self.the_board; end

      # Produces a quote from Control
      # 
      # ```ruby
      # Faker::Games::Control.quote #=> "He never liked fridge duty"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Fallout < Faker::Base
      # Produces the name of a character from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.character #=> "Liberty Prime"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a faction from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.faction #=> "Brotherhood of Steel"
      # ```
      sig { returns(::String) }
      def self.faction; end

      # Produces the name of a location from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.location #=> "New Vegas"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.quote
      #   #=> "Democracy is non-negotiable"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Pokemon < Faker::Base
      # Produces the name of a Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.name #=> "Pikachu"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a location from Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.location #=> "Pallet Town"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a move from Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.move #=> "Thunder Shock"
      # ```
      sig { returns(::String) }
      def self.move; end
    end

    class Witcher < Faker::Base
      # Produces the name of a character from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.character #=> "Triss Merigold"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a witcher from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.witcher #=> "Geralt of Rivia"
      # ```
      sig { returns(::String) }
      def self.witcher; end

      # Produces the name of a school from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.school #=> "Wolf"
      # ```
      sig { returns(::String) }
      def self.school; end

      # Produces the name of a location from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.location #=> "Novigrad"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.quote #=> "No Lollygagin'!"
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces the name of a monster from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.monster #=> "Katakan"
      # ```
      sig { returns(::String) }
      def self.monster; end
    end

    class HalfLife < Faker::Base
      # Produces the name of a character from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.character #=> "Gordon Freeman"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of an enemy from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.enemy #=> "Headcrab"
      # ```
      sig { returns(::String) }
      def self.enemy; end

      # Produces the name of a location from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.location #=> "Black Mesa Research Facility"
      # ```
      sig { returns(::String) }
      def self.location; end
    end

    class Minecraft < Faker::Base
      # Produces the name of an achievement from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.achievement #=> "Time to Mine!"
      # ```
      sig { returns(::String) }
      def self.achievement; end

      # Produces the name of a biome from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.biome #=> "Jungle"
      # ```
      sig { returns(::String) }
      def self.biome; end

      # Produces the name of a block from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.block #=> "Stone"
      # ```
      sig { returns(::String) }
      def self.block; end

      # Produces the name of a enchantment from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.enchantment #=> "Fire Protection"
      # ```
      sig { returns(::String) }
      def self.enchantment; end

      # Produces the name of a game mode from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.game_mode #=> "Survival"
      # ```
      sig { returns(::String) }
      def self.game_mode; end

      # Produces the name of an item from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.item #=> "Iron Shovel"
      # ```
      sig { returns(::String) }
      def self.item; end

      # Produces the name of a mob from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.item #=> "Sheep"
      # ```
      sig { returns(::String) }
      def self.mob; end

      # Produces the name of a status effect from Minecraft.
      # 
      # ```ruby
      # Faker::Games::Minecraft.status_effect #=> "Weakness"
      # ```
      sig { returns(::String) }
      def self.status_effect; end
    end

    class Overwatch < Faker::Base
      # Produces the name of a hero from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.hero #=> "Tracer"
      # ```
      sig { returns(::String) }
      def self.hero; end

      # Produces the name of a location from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.location #=> "Numbani"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.quote #=> "It's high noon"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class SuperMario < Faker::Base
      # Produces the name of a Super Mario character.
      # 
      # ```ruby
      # Faker::Games::SuperMario.character #=> "Luigi"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a Super Mario game.
      # 
      # ```ruby
      # Faker::Games::SuperMario.game #=> "Super Mario Odyssey"
      # ```
      sig { returns(::String) }
      def self.game; end

      # Produces the name of a Super Mario location.
      # 
      # ```ruby
      # Faker::Games::SuperMario.location #=> "Kong City"
      # ```
      sig { returns(::String) }
      def self.location; end
    end

    class ElderScrolls < Faker::Base
      # Produces the name of a race from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.race #=> "Argonian"
      # ```
      sig { returns(::String) }
      def self.race; end

      # Produces the name of a city from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.city #=> "Whiterun"
      # ```
      sig { returns(::String) }
      def self.city; end

      # Produces the name of a creature from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.creature #=> "Frost Troll"
      # ```
      sig { returns(::String) }
      def self.creature; end

      # Produces the name of a region from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.region #=> "Cyrodiil"
      # ```
      sig { returns(::String) }
      def self.region; end

      # Produces the name of a dragon from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.dragon #=> "Blood Dragon"
      # ```
      sig { returns(::String) }
      def self.dragon; end

      # Produces a randomly generated name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.name #=> "Balgruuf The Old"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a first name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.first_name #=> "Balgruuf"
      # ```
      sig { returns(::String) }
      def self.first_name; end

      # Produces a last name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.last_name #=> "The Old"
      # ```
      sig { returns(::String) }
      def self.last_name; end

      # Produces a weapon from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.weapon #=> "Elven Bow"
      # ```
      sig { returns(::String) }
      def self.weapon; end

      # Produces a weapon from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.jewelry #=> "Silver Ruby Ring"
      # ```
      sig { returns(::String) }
      def self.jewelry; end
    end

    class ClashOfClans < Faker::Base
      # Produces the name of a troop from Clash of Clans.
      # 
      # ```ruby
      # Faker::Games::ClashOfClans.troop #=> "Barbarian"
      # ```
      sig { returns(::String) }
      def self.troop; end

      # Produces the name of a rank from Clash Of Clans.
      # 
      # ```ruby
      # Faker::Games::ClashOfClans.rank #=> "Legend"
      # ```
      sig { returns(::String) }
      def self.rank; end

      # Produces the name of a defensive buiding from Clash Of Clans.
      # 
      # ```ruby
      # Faker::Games::ClashOfClans.defensive_building #=> "Cannon"
      # ```
      sig { returns(::String) }
      def self.defensive_building; end
    end

    class StreetFighter < Faker::Base
      # Produces the name of a playable character from Street Fighter.
      # 
      # ```ruby
      # Faker::Games::StreetFighter.character #=> "Ryu"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a stage from Street Fighter.
      # 
      # ```ruby
      # Faker::Games::StreetFighter.stage #=> "Volcanic Rim"
      # ```
      sig { returns(::String) }
      def self.stage; end

      # Produces a quote from Street Fighter.
      # 
      # ```ruby
      # Faker::Games::StreetFighter.quote #=> "Go home and be a family man."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces the name of a move from Street Fighter.
      # 
      # ```ruby
      # Faker::Games::StreetFighter.move #=> "Shoryuken"
      # ```
      sig { returns(::String) }
      def self.move; end
    end

    class SuperSmashBros < Faker::Base
      # Produces the name of a fighter from the Smash Bros games.
      # 
      # ```ruby
      # Faker::Games::SuperSmashBros.fighter #=> "Mario"
      # ```
      sig { returns(::String) }
      def self.fighter; end

      # Produces the name of a stage from the Smash Bros games.
      # 
      # ```ruby
      # Faker::Games::SuperSmashBros.stage #=> "Final Destination"
      # ```
      sig { returns(::String) }
      def self.stage; end
    end

    class LeagueOfLegends < Faker::Base
      # Produces the name of a champion from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.champion #=> "Jarvan IV"
      # ```
      sig { returns(::String) }
      def self.champion; end

      # Produces a location from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.location #=> "Demacia"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.quote #=> "Purge the unjust."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a summoner spell from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.summoner_spell #=> "Flash"
      # ```
      sig { returns(::String) }
      def self.summoner_spell; end

      # Produces a mastery from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.masteries #=> "Double Edged Sword"
      # ```
      sig { returns(::String) }
      def self.masteries; end

      # Produces a rank from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.rank #=> "Bronze V"
      # ```
      sig { returns(::String) }
      def self.rank; end
    end

    class WarhammerFantasy < Faker::Base
      # Produces the name of a hero from the Warhammer Fantasy setting.
      # 
      # ```ruby
      # Faker::Games::WarhammerFantasy.hero #=> "Sigmar Heldenhammer"
      # ```
      sig { returns(::String) }
      def self.hero; end

      # Produces a quote from the Warhammer Fantasy setting.
      # 
      # ```ruby
      # Faker::Games::WarhammerFantasy.quote #=> "The softest part of a castle is the belly of the man inside."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a location from the Warhammer Fantasy setting.
      # 
      # ```ruby
      # Faker::Games::WarhammerFantasy.location #=> "Lustria"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a faction from the Warhammer Fantasy setting.
      # 
      # ```ruby
      # Faker::Games::WarhammerFantasy.faction #=> "Bretonnia"
      # ```
      sig { returns(::String) }
      def self.faction; end

      # Produces a creature from the Warhammer Fantasy setting.
      # 
      # ```ruby
      # Faker::Games::WarhammerFantasy.creature #=> "Hydra"
      # ```
      sig { returns(::String) }
      def self.creature; end
    end

    class WorldOfWarcraft < Faker::Base
      # Produces the name of a hero from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.hero #=> "Uther the Lightbringer"
      # ```
      sig { returns(::String) }
      def self.hero; end

      # Produces a class name from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.class_name #=> "Druid"
      # ```
      sig { returns(::String) }
      def self.class_name; end

      # Produces the name of a race from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.race #=> "Druid"
      # ```
      sig { returns(::String) }
      def self.race; end

      # Produces a quote from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.quote #=> "These are dark times indeed."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class SonicTheHedgehog < Faker::Base
      # Produces the name of a character from Sonic the Hedgehog.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.character #=> "Sonic the Hedgehog"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a zone from Sonic the Hedgehog.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.zone #=> "Green Hill Zone"
      # ```
      sig { returns(::String) }
      def self.zone; end

      # Produces the name of a game from the Sonic the Hedgehog series.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.game #=> "Waku Waku Sonic Patrol Car"
      # ```
      sig { returns(::String) }
      def self.game; end
    end

    class HeroesOfTheStorm < Faker::Base
      # Produces a battleground from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.battleground #=> "Towers of Doom"
      # ```
      sig { returns(::String) }
      def self.battleground; end

      # This method is deprecated. The implementation will be removed in a near future release.
      # Use `HeroesOfTheStorm.class_name` instead.
      # 
      # _@deprecated_ — Use {#class_name} instead.
      sig { returns(T.untyped) }
      def self.class; end

      # Produces a class name from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.class_name #=> "Support"
      # ```
      sig { returns(::String) }
      def self.class_name; end

      # Produces a hero from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.hero #=> "Illidan"
      # ```
      sig { returns(::String) }
      def self.hero; end

      # Produces a quote from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.quote #=> "MEAT!!!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end
  end

  class Book < Faker::Base
    # Produces a random book title
    # 
    # ```ruby
    # Faker::Book.title #=> "The Odd Sister"
    # ```
    sig { returns(::String) }
    def self.title; end

    # Produces a random book author
    # 
    # ```ruby
    # Faker::Book.author #=> "Alysha Olsen"
    # ```
    sig { returns(::String) }
    def self.author; end

    # Produces a random book publisher
    # 
    # ```ruby
    # Faker::Book.publisher #=> "Opus Reader"
    # ```
    sig { returns(::String) }
    def self.publisher; end

    # Produces a random genre
    # 
    # ```ruby
    # Faker::Book.genre #=> "Mystery"
    # ```
    sig { returns(::String) }
    def self.genre; end
  end

  class Books
    # 
    # A Faker module beyond your dreams, test data beyond your imagination.
    class Dune < Faker::Base
      # Produces the name of a character from Dune
      # 
      # ```ruby
      # Faker::Books::Dune.character #=> "Leto Atreides"
      # ```
      sig { returns(::String) }
      def self.character; end

      # ```ruby
      # Faker::Books::Dune.title #=> "Duke"
      # ```
      sig { returns(::String) }
      def self.title; end

      # Produces the name of a city from Dune
      # 
      # ```ruby
      # Faker::Books::Dune.city #=> "Arrakeen"
      # ```
      sig { returns(::String) }
      def self.city; end

      # Produces the name of a planet from Dune
      # 
      # ```ruby
      # Faker::Books::Dune.planet #=> "Caladan"
      # ```
      sig { returns(::String) }
      def self.planet; end

      # Produces a quote from Dune
      # 
      # _@param_ `character` — The name of the character that the quote should be from
      # 
      # ```ruby
      # Faker::Books::Dune.quote
      #   #=> "A dead man, surely, no longer requires that water."
      # ```
      # 
      # ```ruby
      # Faker::Books::Dune.quote(character: "baron_harkonnen")
      #   #=> "He who controls the spice, controls the universe!"
      # ```
      sig { params(legacy_character: T.untyped, character: T.nilable(::String)).returns(::String) }
      def self.quote(legacy_character = T.unsafe(nil), character: nil); end

      # Produces a saying from Dune
      # 
      # _@param_ `source`
      # 
      # ```ruby
      # Faker::Books::Dune.saying #=> "You do not beg the sun for mercy."
      # ```
      # 
      # ```ruby
      # Faker::Books::Dune.saying(source: "fremen")
      #   #=> "May thy knife chip and shatter."
      # ```
      sig { params(legacy_source: T.untyped, source: T.nilable(::String)).returns(::String) }
      def self.saying(legacy_source = T.unsafe(nil), source: nil); end
    end

    class Lovecraft < Faker::Base
      # Produces the name of a location
      # 
      # ```ruby
      # Faker::Books::Lovecraft.location #=> "Kingsport"
      # ```
      sig { returns(::String) }
      def self.location; end

      # _@param_ `number` — The number of times to repeat the chant
      # 
      # ```ruby
      # Faker::Books::Lovecraft.fhtagn
      #   #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.fhtagn(number: 3)
      #   #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fht...
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(::String) }
      def self.fhtagn(legacy_number = T.unsafe(nil), number: 1); end

      # Produces the name of a deity
      # 
      # ```ruby
      # Faker::Books::Lovecraft.deity #=> "Shub-Niggurath"
      # ```
      sig { returns(::String) }
      def self.deity; end

      # Produces the name of a tome
      # 
      # ```ruby
      # Faker::Books::Lovecraft.tome #=> "Book of Eibon"
      # ```
      sig { returns(::String) }
      def self.tome; end

      # Produces a random sentence
      # 
      # _@param_ `word_count` — The number of words to have in the sentence
      # 
      # _@param_ `random_words_to_add`
      # 
      # _@param_ `open_compounds_allowed` — If true, generated sentence can contain words having additional spaces
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence
      #   #=> "Furtive antiquarian squamous dank cat loathsome amorphous lurk."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence(word_count: 3)
      #   #=> "Daemoniac antediluvian fainted squamous comprehension gambrel nameless singular."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence(word_count: 3, random_words_to_add: 1)
      #   #=> "Amorphous indescribable tenebrous."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence(word_count: 3, random_words_to_add: 0, open_compounds_allowed: true)
      #   #=> "Effulgence unmentionable gambrel."
      # ```
      sig do
        params(
          legacy_word_count: T.untyped,
          legacy_random_words_to_add: T.untyped,
          word_count: Integer,
          random_words_to_add: Integer,
          open_compounds_allowed: T::Boolean
        ).returns(::String)
      end
      def self.sentence(legacy_word_count = T.unsafe(nil), legacy_random_words_to_add = T.unsafe(nil), word_count: 4, random_words_to_add: 6, open_compounds_allowed: true); end

      # Produces a random word
      # 
      # ```ruby
      # Faker::Books::Lovecraft.word #=> "furtive"
      # ```
      sig { returns(::String) }
      def self.word; end

      # Produces a array of random words
      # 
      # _@param_ `number` — Number of words to generate
      # 
      # _@param_ `spaces_allowed` — If true, generated words can contain spaces
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words
      # #=> [
      # #     "manuscript",
      # #     "abnormal",
      # #     "singular",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words(number: 2)
      # #=> [
      # #     "daemoniac",
      # #     "cat",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words(number: 2, spaces_allowed: 1)
      # #=> [
      # #     "lurk",
      # #     "charnel",
      # #   ]
      # ```
      sig do
        params(
          legacy_number: T.untyped,
          legacy_spaces_allowed: T.untyped,
          number: Integer,
          spaces_allowed: T::Boolean
        ).returns(T::Array[::String])
      end
      def self.words(legacy_number = T.unsafe(nil), legacy_spaces_allowed = T.unsafe(nil), number: 3, spaces_allowed: false); end

      # Produces a array of random sentences
      # 
      # _@param_ `number` — Number of sentences to generate
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentences
      # #=> [
      # #     "Nameless loathsome decadent gambrel.",
      # #     "Ululate swarthy immemorial cat madness gibbous unmentionable unnamable.",
      # #     "Decadent antediluvian non-euclidean tentacles amorphous tenebrous.",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentences(number: 2)
      # #=> [
      # #     "Antediluvian amorphous unmentionable singular accursed squamous immemorial.",
      # #     "Gambrel daemoniac gibbous stygian shunned ululate iridescence abnormal.",
      # #   ]
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(T::Array[::String]) }
      def self.sentences(legacy_number = T.unsafe(nil), number: 3); end

      # Produces a random paragraph
      # 
      # _@param_ `sentence_count` — Number of sentences to generate
      # 
      # _@param_ `random_sentences_to_add`
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph
      #   #=> "Squamous nameless daemoniac fungus ululate. Cyclopean stygian decadent loathsome manuscript tenebrous. Foetid abnormal stench. Dank non-euclidean comprehension eldritch. Charnel singular shunned lurk effulgence fungus."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph(sentence_count: 2)
      #   #=> "Decadent lurk tenebrous loathsome furtive spectral amorphous gibbous. Gambrel eldritch daemoniac cat madness comprehension stygian effulgence."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph(sentence_count: 1, random_sentences_to_add: 1)
      #   #=> "Stench cyclopean fainted antiquarian nameless. Antiquarian ululate tenebrous non-euclidean effulgence."
      # ```
      sig do
        params(
          legacy_sentence_count: T.untyped,
          legacy_random_sentences_to_add: T.untyped,
          sentence_count: Integer,
          random_sentences_to_add: Integer
        ).returns(::String)
      end
      def self.paragraph(legacy_sentence_count = T.unsafe(nil), legacy_random_sentences_to_add = T.unsafe(nil), sentence_count: 3, random_sentences_to_add: 3); end

      # Produces a array of random paragraphs
      # 
      # _@param_ `number` — Number of paragraphs to generate
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraphs
      # #=> [
      # #     "Noisome daemoniac gibbous abnormal antediluvian. Unutterable fung...
      # #     "Non-euclidean immemorial indescribable accursed furtive. Dank unn...
      # #     "Charnel antediluvian unnamable cat blasphemous comprehension tene...
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraphs(number: 2)
      # #=> [
      # #     "Hideous amorphous manuscript antediluvian non-euclidean cat eldri...
      # #     "Tenebrous unnamable comprehension antediluvian lurk. Lurk spectra...
      # #   ]
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(T::Array[::String]) }
      def self.paragraphs(legacy_number = T.unsafe(nil), number: 3); end

      # _@param_ `characters` — Number of characters to generate in the paragraph
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph_by_chars
      #   #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph_by_chars(characters: 128)
      #   #=> "Effulgence madness noisome. Fungus stygian mortal madness amorphous dank. Decadent noisome hideous effulgence. Tentacles charne."
      # ```
      sig { params(legacy_characters: T.untyped, characters: Integer).returns(::String) }
      def self.paragraph_by_chars(legacy_characters = T.unsafe(nil), characters: 256); end
    end

    class CultureSeries < Faker::Base
      # ```ruby
      # Faker::Books::CultureSeries.book
      #   #=> "The Player of Games"
      # ```
      sig { returns(::String) }
      def self.book; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship
      #   #=> "Fate Amenable To Change"
      # ```
      sig { returns(::String) }
      def self.culture_ship; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship_class
      #   #=> "General Systems Vehicle"
      # ```
      sig { returns(::String) }
      def self.culture_ship_class; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship_class_abv
      #   #=> "The Odd Sister"
      # ```
      sig { returns(::String) }
      def self.culture_ship_class_abv; end

      # ```ruby
      # Faker::Books::CultureSeries.civ
      #   #=> "Culture"
      # ```
      sig { returns(::String) }
      def self.civ; end

      # ```ruby
      # Faker::Books::CultureSeries.planet
      #   #=> "Xinth"
      # ```
      sig { returns(::String) }
      def self.planet; end
    end
  end

  class Game < Faker::Base
    # Produces the name of a video game.
    # 
    # ```ruby
    # Faker::Game.title #=> "Half-Life 2"
    # ```
    sig { returns(::String) }
    def self.title; end

    # Produces the name of a video game genre.
    # 
    # ```ruby
    # Faker::Game.genre #=> "Real-time strategy"
    # ```
    sig { returns(::String) }
    def self.genre; end

    # Produces the name of a video game console or platform.
    # 
    # ```ruby
    # Faker::Game.platform #=> "Nintendo Switch"
    # ```
    sig { returns(::String) }
    def self.platform; end
  end

  # A generator of titles of operas by various composers
  class Music < Faker::Base
    # Produces the name of a key/note, using letter notation.
    # 
    # ```ruby
    # Faker::Music.key #=> "A#"
    # ```
    sig { returns(::String) }
    def self.key; end

    # Produces the name of a chord, using letter notation.
    # 
    # ```ruby
    # Faker::Music.chord #=> "Adim7"
    # ```
    sig { returns(::String) }
    def self.chord; end

    # Produces the name of an instrument.
    # 
    # ```ruby
    # Faker::Music.instrument #=> "Acoustic Guitar"
    # ```
    sig { returns(::String) }
    def self.instrument; end

    # Produces an array of the letter names of musical notes, without accidentals.
    sig { returns(T::Array[::String]) }
    def self.keys; end

    # Produces an array of accidentals (with "natural" denoted as an empty string).
    sig { returns(T::Array[::String]) }
    def self.key_variants; end

    # Produces an array of key types (with "major" denoted as an empty string).
    # 
    # ```ruby
    # Faker::Music.key_types #=> ['', 'm']
    # ```
    sig { returns(T::Array[::String]) }
    def self.key_types; end

    # Produces an array of types of chords.
    sig { returns(T::Array[::String]) }
    def self.chord_types; end

    # Produces the name of a band.
    # 
    # ```ruby
    # Faker::Music.band #=> "The Beatles"
    # ```
    sig { returns(::String) }
    def self.band; end

    # Produces the name of an album.
    # 
    # ```ruby
    # Faker::Music.album #=> "Sgt. Pepper's Lonely Hearts Club"
    # ```
    sig { returns(::String) }
    def self.album; end

    # Produces the name of a musical genre.
    # 
    # ```ruby
    # Faker::Music.genre #=> "Rock"
    # ```
    sig { returns(::String) }
    def self.genre; end

    class Rush < Faker::Base
      # Produces the name of a member of Rush
      # 
      # ```ruby
      # Faker::Music::Rush.player #=> "Geddy Lee"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of an album by Rush
      # 
      # ```ruby
      # Faker::Music::Rush.album #=> "Hold Your Fire"
      # ```
      sig { returns(::String) }
      def self.album; end
    end

    class Opera < Faker::Base
      # Produces the title of an opera by Giuseppe Verdi.
      # 
      # ```ruby
      # Faker::Music::Opera.verdi #=> "Il Trovatore"
      # ```
      sig { returns(::String) }
      def self.verdi; end

      # Produces the title of an opera by Gioacchino Rossini.
      # 
      # ```ruby
      # Faker::Music::Opera.rossini #=> "Il Barbiere di Siviglia"
      # ```
      sig { returns(::String) }
      def self.rossini; end

      # Produces the title of an opera by Gaetano Donizetti.
      # 
      # ```ruby
      # Faker::Music::Opera.donizetti #=> "Lucia di Lammermoor"
      # ```
      sig { returns(::String) }
      def self.donizetti; end

      # Produces the title of an opera by Vincenzo Bellini.
      # 
      # ```ruby
      # Faker::Music::Opera.bellini #=> "Norma"
      # ```
      sig { returns(::String) }
      def self.bellini; end

      # Produces the title of an opera by Wolfgang Amadeus Mozart.
      # 
      # ```ruby
      # Faker::Music::Opera.mozart #=> "Die Zauberfloete"
      # ```
      sig { returns(::String) }
      def self.mozart; end

      # Produces the title of an Italian opera by Wolfgang Amadeus Mozart.
      # 
      # ```ruby
      # Faker::Music::Opera.mozart_it #=> "Cosi fan tutte"
      # ```
      sig { returns(::String) }
      def self.mozart_italian; end

      # Produces the title of a German opera by Wolfgang Amadeus Mozart.
      # 
      # ```ruby
      # Faker::Music::Opera.mozart_ger #=> "Die Zauberfloete"
      # ```
      sig { returns(::String) }
      def self.mozart_german; end

      # Produces the title of an opera by Christoph Willibald Gluck.
      # 
      # ```ruby
      # Faker::Music::Opera.gluck #=> "Orfeo ed Euridice"
      # ```
      sig { returns(::String) }
      def self.gluck; end

      # Produces the title of an Italian opera by Christoph Willibald Gluck.
      # 
      # ```ruby
      # Faker::Music::Opera.gluck_it #=> "Orfeo ed Euridice"
      # ```
      sig { returns(::String) }
      def self.gluck_italian; end

      # Produces the title of a French opera by Christoph Willibald Gluck.
      # 
      # ```ruby
      # Faker::Music::Opera.gluck_fr #=> "Orphee et Euridice"
      # ```
      sig { returns(::String) }
      def self.gluck_french; end

      # Produces the title of an opera by Ludwig van Beethoven.
      # 
      # ```ruby
      # Faker::Music::Opera.beethoven #=> "Fidelio"
      # ```
      sig { returns(::String) }
      def self.beethoven; end

      # Produces the title of an opera by Carl Maria von Weber.
      # 
      # ```ruby
      # Faker::Music::Opera.weber #=> "Der Freischuetz"
      # ```
      sig { returns(::String) }
      def self.weber; end

      # Produces the title of an opera by Richard Strauss.
      # 
      # ```ruby
      # Faker::Music::Opera.strauss #=> "Elektra"
      # ```
      sig { returns(::String) }
      def self.strauss; end

      # Produces the title of an opera by Richard Wagner.
      # 
      # ```ruby
      # Faker::Music::Opera.wagner #=> "Tristan und Isolde"
      # ```
      sig { returns(::String) }
      def self.wagner; end

      # Produces the title of an opera by Robert Schumann.
      # 
      # ```ruby
      # Faker::Music::Opera.schumann #=> "Genoveva"
      # ```
      sig { returns(::String) }
      def self.schumann; end

      # Produces the title of an opera by Franz Schubert.
      # 
      # ```ruby
      # Faker::Music::Opera.schubert #=> "Alfonso und Estrella"
      # ```
      sig { returns(::String) }
      def self.schubert; end

      # Produces the title of an opera by Alban Berg.
      # 
      # ```ruby
      # Faker::Music::Opera.berg #=> "Wozzeck"
      # ```
      sig { returns(::String) }
      def self.berg; end

      # Produces the title of an opera by Maurice Ravel.
      # 
      # ```ruby
      # Faker::Music::Opera.ravel #=> "L'enfant et les sortileges"
      # ```
      sig { returns(::String) }
      def self.ravel; end

      # Produces the title of an opera by Hector Berlioz.
      # 
      # ```ruby
      # Faker::Music::Opera.berlioz #=> "Les Troyens"
      # ```
      sig { returns(::String) }
      def self.berlioz; end

      # Produces the title of an opera by Georges Bizet.
      # 
      # ```ruby
      # Faker::Music::Opera.bizet #=> "Carmen"
      # ```
      sig { returns(::String) }
      def self.bizet; end

      # Produces the title of an opera by Charles Gounod.
      # 
      # ```ruby
      # Faker::Music::Opera.gounod #=> "Faust"
      # ```
      sig { returns(::String) }
      def self.gounod; end

      # Produces the title of an opera by Camille Saint-Saens.
      # 
      # ```ruby
      # Faker::Music::Opera.saint_saens #=> "Samson and Delilah"
      # ```
      sig { returns(::String) }
      def self.saint_saens; end
    end

    class Phish < Faker::Base
      # Produces the name of a album by Phish.
      # 
      # ```ruby
      # Faker::Music::Phish.album #=> "Fuego"
      # ```
      sig { returns(::String) }
      def self.album; end

      # Produces the name of a musician in Phish.
      # 
      # ```ruby
      # Faker::Music::Phish.musician #=> "Trey Anastasio"
      # ```
      sig { returns(::String) }
      def self.musician; end

      # Produces the name of a song by Phish.
      # 
      # ```ruby
      # Faker::Music::Phish.song #=> "Tweezer"
      # ```
      sig { returns(::String) }
      def self.song; end
    end

    class Hiphop < Faker::Base
      # Produces the name of a Hip Hop Artist
      # 
      # ```ruby
      # Faker::Music::Hiphop.artist #=> "Lil Wayne"
      # ```
      sig { returns(::String) }
      def self.artist; end

      # Produces the name of a Hip Hop Group
      # 
      # ```ruby
      # Faker::Music::Hiphop.groups #=> "OVO"
      # ```
      sig { returns(::String) }
      def self.groups; end

      # Produces the name of a Hip Hop Subgenre
      # 
      # ```ruby
      # Faker::Music::Hiphop.subgeneres #=> "Alternative"
      # ```
      sig { returns(::String) }
      def self.subgenres; end
    end

    class Prince < Faker::Base
      # Produces a random Prince song.
      # 
      # ```ruby
      # Faker::Music::Prince.song #=> "Raspberry Beret"
      # Faker::Music::Prince.song #=> "Starfish And Coffee"
      # ```
      sig { returns(::String) }
      def self.song; end

      # Produces a random Prince song lyric.
      # 
      # ```ruby
      # Faker::Music::Prince.lyric #=> "Dearly beloved, we are gathered here today to get through this thing called life."
      # Faker::Music::Prince.lyric #=> "You were so hard to find, the beautiful ones, they hurt you every time."
      # ```
      sig { returns(::String) }
      def self.lyric; end

      # Produces a random Prince album.
      # 
      # ```ruby
      # Faker::Music::Prince.album #=> "The Gold Experience"
      # Faker::Music::Prince.album #=> "Purple Rain"
      # ```
      sig { returns(::String) }
      def self.album; end

      # Produces a random Prince-associated band.
      # 
      # ```ruby
      # Faker::Music::Prince.band #=> "The New Power Generation"
      # ```
      sig { returns(::String) }
      def self.band; end
    end

    class PearlJam < Faker::Base
      # Produces the name of a member of Pearl Jam (current and former)
      # 
      # ```ruby
      # Faker::Music::PearlJam.musician #=> "Eddie Vedder"
      # ```
      sig { returns(::String) }
      def self.musician; end

      # Produces the name of an album by Pearl Jam.
      # 
      # ```ruby
      # Faker::Music::PearlJam.album #=> "Ten"
      # ```
      sig { returns(::String) }
      def self.album; end

      # Produces the name of a song by Pearl Jam.
      # 
      # ```ruby
      # Faker::Music::PearlJam.song #=> "Even Flow"
      # ```
      sig { returns(::String) }
      def self.song; end
    end

    class RockBand < Faker::Base
      # Produces the name of a rock band.
      # 
      # ```ruby
      # Faker::Music::RockBand.name #=> "Led Zeppelin"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a rock song.
      # 
      # ```ruby
      # Faker::Music::RockBand.song #=> "Dani California"
      # ```
      sig { returns(::String) }
      def self.song; end
    end

    class GratefulDead < Faker::Base
      # Produces the name of a member of The Grateful Dead.
      # 
      # ```ruby
      # Faker::Music::GratefulDead.player #=> "Jerry Garcia"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of a song by The Grateful Dead.
      # 
      # ```ruby
      # Faker::Music::GratefulDead.song #=> "Cassidy"
      # ```
      sig { returns(::String) }
      def self.song; end
    end

    class UmphreysMcgee < Faker::Base
      # Produces the name of a song by Umphrey's McGee.
      # 
      # ```ruby
      # Faker::Music::UmphreysMcgee.song #=> "Dump City"
      # ```
      sig { returns(::String) }
      def self.song; end
    end
  end

  class Show < Faker::Base
    # Produces the name of a musical for an older audience
    # 
    # ```ruby
    # Faker::Alphanumeric.alpha
    #   #=> "West Side Story"
    # ```
    sig { returns(::String) }
    def self.adult_musical; end

    # Produces the name of a musical for a younger audience
    # 
    # ```ruby
    # Faker::Alphanumeric.alpha
    #   #=> "Into the Woods JR."
    # ```
    sig { returns(::String) }
    def self.kids_musical; end

    # Produces the name of a play
    # 
    # ```ruby
    # Faker::Alphanumeric.alpha
    #   #=> "Death of a Salesman"
    # ```
    sig { returns(::String) }
    def self.play; end
  end

  class App < Faker::Base
    # Produces an app name.
    # 
    # ```ruby
    # Faker::App.name #=> "Treeflex"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a version string.
    # 
    # ```ruby
    # Faker::App.version #=> "1.85"
    # ```
    sig { returns(::String) }
    def self.version; end

    # Produces the name of an app's author.
    # 
    # ```ruby
    # Faker::App.author #=> "Daphne Swift"
    # ```
    sig { returns(::String) }
    def self.author; end

    # Produces a String representing a semantic version identifier.
    # 
    # _@param_ `major` — An integer to use or a range to pick the integer from.
    # 
    # _@param_ `minor` — An integer to use or a range to pick the integer from.
    # 
    # _@param_ `patch` — An integer to use or a range to pick the integer from.
    # 
    # ```ruby
    # Faker::App.semantic_version #=> "3.2.5"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(major: 42) #=> "42.5.2"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(minor: 100..101) #=> "42.100.4"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(patch: 5..6) #=> "7.2.6"
    # ```
    sig do
      params(
        legacy_major: T.untyped,
        legacy_minor: T.untyped,
        legacy_patch: T.untyped,
        major: T.any(Integer, T::Range[T.untyped]),
        minor: T.any(Integer, T::Range[T.untyped]),
        patch: T.any(Integer, T::Range[T.untyped])
      ).returns(::String)
    end
    def self.semantic_version(legacy_major = T.unsafe(nil), legacy_minor = T.unsafe(nil), legacy_patch = T.unsafe(nil), major: 0..9, minor: 0..9, patch: 1..9); end
  end

  class Job < Faker::Base
    # Produces a random job title.
    # 
    # ```ruby
    # Faker::Job.title #=> "Construction Manager"
    # ```
    sig { returns(::String) }
    def self.title; end

    # Produces a random job position.
    # 
    # ```ruby
    # Faker::Job.position #=> "Strategist"
    # ```
    sig { returns(::String) }
    def self.position; end

    # Produces a random job field.
    # 
    # ```ruby
    # Faker::Job.field #=> "Banking"
    # ```
    sig { returns(::String) }
    def self.field; end

    # Produces a random job skill.
    # 
    # ```ruby
    # Faker::Job.key_skill #=> "Leadership"
    # ```
    sig { returns(::String) }
    def self.key_skill; end
  end

  class NationalHealthService < Faker::Base
    # Produces a random British NHS number.
    # 
    # ```ruby
    # Faker::NationalHealthService.british_number #=> "403 958 5577"
    # ```
    sig { returns(::String) }
    def self.british_number; end

    # Produces a random British NHS number's check digit.
    # 
    # _@param_ `number` — Specifies the NHS number the check digit belongs to.
    # 
    # ```ruby
    # Faker::NationalHealthService.check_digit(number: 400_012_114) #=> 6
    # ```
    sig { params(legacy_number: T.untyped, number: Integer).returns(Integer) }
    def self.check_digit(legacy_number = T.unsafe(nil), number: 0); end
  end

  class Movies
    class TheRoom < Faker::Base
      # Produces an actor from The Room (2003).
      # 
      # ```ruby
      # Faker::Movies::Room.actor #=> "Tommy Wiseau"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from The Room (2003).
      # 
      # ```ruby
      # Faker::Movies::Room.character #=> "Johnny"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from The Room (2003).
      # 
      # ```ruby
      # Faker::Movies::Room.location #=> "Johnny's Apartment"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from The Room (2003).
      # 
      # ```ruby
      # Faker::Movies::Room.quote
      #   #=> "You're lying, I never hit you. You are tearing me apart, Lisa!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Hobbit < Faker::Base
      # Produces the name of a character from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.character #=> "Gandalf the Grey"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of one of the 13 dwarves from the Company, or Gandalf or Bilbo.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.thorins_company #=> "Thorin Oakenshield"
      # ```
      sig { returns(::String) }
      def self.thorins_company; end

      # Produces a quote from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.quote
      #   #=> "Never laugh at live dragons, Bilbo you fool!"
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces the name of a location from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.location #=> "The Shire"
      # ```
      sig { returns(::String) }
      def self.location; end
    end

    class Departed < Faker::Base
      # Produces an actor from The Departed.
      # 
      # ```ruby
      # Faker::Movies::Departed.actor #=> "Matt Damon"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from The Departed.
      # 
      # ```ruby
      # Faker::Movies::Departed.character #=> "Frank Costello"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from The Departed.
      # 
      # ```ruby
      # Faker::Movies::Departed.quote
      #   #=> "I'm the guy who does his job. You must be the other guy"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Lebowski < Faker::Base
      # Produces an actor from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.actor #=> "John Goodman"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.character #=> "Jackie Treehorn"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.quote #=> "Forget it, Donny, you're out of your element!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class StarWars < Faker::Base
      # Produces a call squadron from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_squadron #=> "Green"
      # ```
      sig { returns(::String) }
      def self.call_squadron; end

      # Produces a call sign from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_sign #=> "Grey 5"
      # ```
      sig { returns(::String) }
      def self.call_sign; end

      # Produces a call number from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_number #=> "Leader"
      # ```
      sig { returns(::String) }
      def self.call_number; end

      # Produces a character from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.character #=> "Anakin Skywalker"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a droid from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.droid #=> "C-3PO"
      # ```
      sig { returns(::String) }
      def self.droid; end

      # Produces a planet from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.planet #=> "Tatooine"
      # ```
      sig { returns(::String) }
      def self.planet; end

      # Produces a species from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.specie #=> "Gungan"
      # ```
      sig { returns(::String) }
      def self.specie; end

      # Produces a vehicle from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.vehicle #=> "Sandcrawler"
      # ```
      sig { returns(::String) }
      def self.vehicle; end

      # Produces a wookiee sentence from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.wookiee_sentence #=> "Yrroonn ru ooma roo ahuma ur roooarrgh hnn-rowr."
      # ```
      sig { returns(::String) }
      def self.wookiee_sentence; end

      # Produces a quote from Star Wars.
      # 
      # _@param_ `character` — The name of a character to derive a quote from.
      # 
      # ```ruby
      # Faker::Movies::StarWars.quote #=> "Aren't you a little short for a Stormtrooper?"
      # ```
      # 
      # ```ruby
      # Faker::Movies::StarWars.quote(character: "leia_organa")
      #   #=> "Aren't you a little short for a Stormtrooper?"
      # ```
      sig { params(legacy_character: T.untyped, character: T.nilable(::String)).returns(::String) }
      def self.quote(legacy_character = T.unsafe(nil), character: nil); end

      sig { returns(T.untyped) }
      def self.call_numbers; end

      sig { returns(T.untyped) }
      def self.call_squadrons; end

      sig { returns(T.untyped) }
      def self.characters; end

      sig { returns(T.untyped) }
      def self.droids; end

      sig { returns(T.untyped) }
      def self.planets; end

      sig { returns(T.untyped) }
      def self.species; end

      sig { returns(T.untyped) }
      def self.vehicles; end

      sig { returns(T.untyped) }
      def self.wookiee_words; end
    end

    class Ghostbusters < Faker::Base
      # Produces an actor from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.actor #=> "Bill Murray"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.character #=> "Dr. Egon Spengler"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.quote
      #   #=> "I tried to think of the most harmless thing. Something I loved from my childhood. Something that could never ever possibly destroy us. Mr. Stay Puft!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class HarryPotter < Faker::Base
      # Produces a character from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.character #=> "Harry Potter"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.location #=> "Hogwarts"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.quote #=> "I solemnly swear that I am up to good."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a book from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.book #=> "Harry Potter and the Chamber of Secrets"
      # ```
      sig { returns(::String) }
      def self.book; end

      # Produces a house from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.house #=> "Gryffindor"
      # ```
      sig { returns(::String) }
      def self.house; end

      # Produces a spell from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.spell #=> "Reparo"
      # ```
      sig { returns(::String) }
      def self.spell; end
    end

    class PrincessBride < Faker::Base
      # Produces a character from The Princess Bride.
      # 
      # ```ruby
      # Faker::Movies::PrincessBride.character #=> "Dread Pirate Roberts"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from The Princess Bride.
      # 
      # ```ruby
      # Faker::Movies::PrincessBride.quote
      #   #=> "Hello. My name is Inigo Montoya. You killed my father. Prepare to die!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class VForVendetta < Faker::Base
      # Produces a character from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.character #=> "V"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a speech from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.speech
      #   #=> "Remember, remember, the Fifth of November, the Gunpowder Treason and Plot. I know of no reason why the Gunpowder Treason should ever be forgot..."
      # ```
      sig { returns(::String) }
      def self.speech; end

      # Produces a quote from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.quote
      #   #=> "People should not be afraid of their governments. Governments should be afraid of their people."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class LordOfTheRings < Faker::Base
      # Produces a character from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.character #=> "Legolas"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.location #=> "Helm's Deep"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.quote
      #   #=> "I wish the Ring had never come to me. I wish none of this had happened."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class BackToTheFuture < Faker::Base
      # Produces a character from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.character #=> "Marty McFly"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a date from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.date #=> "November 5, 1955"
      # ```
      sig { returns(::String) }
      def self.date; end

      # Produces a quote from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.quote
      #   #=> "Roads? Where we're going, we don't need roads."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class HowToTrainYourDragon < Faker::Base
      # Produces a character from How To Train Your Dragon.
      # 
      # ```ruby
      # Faker::Movies::HowToTrainYourDragon.character #=> "Hiccup"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from How To Train Your Dragon.
      # 
      # ```ruby
      # Faker::Movies::HowToTrainYourDragon.location #=> "Berk"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a dragon from How To Train Your Dragon.
      # 
      # ```ruby
      # Faker::Movies::HowToTrainYourDragon.dragons #=> "Toothless"
      # ```
      sig { returns(::String) }
      def self.dragon; end
    end

    class HitchhikersGuideToTheGalaxy < Faker::Base
      # Produces a character from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.character #=> "Marvin"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.location
      #   #=> "Arthur Dent's house"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a Marvin quote from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
      #   #=> "Life? Don't talk to me about life."
      # ```
      sig { returns(::String) }
      def self.marvin_quote; end

      # Produces a planet from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.planet
      #   #=> "Magrathea"
      # ```
      sig { returns(::String) }
      def self.planet; end

      # Produces a quote from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.quote
      #   #=> "In the beginning, the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a species from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.specie
      #   #=> "Perfectly Normal Beast"
      # ```
      sig { returns(::String) }
      def self.specie; end

      # Produces a starship from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.starship
      #   #=> "Vogon Constructor Fleet"
      # ```
      sig { returns(::String) }
      def self.starship; end
    end
  end

  class Creature
    class Cat < Faker::Base
      # Produces a random name for a cat
      # 
      # ```ruby
      # Faker::Creature::Cat.name #=> "Felix"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a random cat breed
      # 
      # ```ruby
      # Faker::Creature::Cat.breed #=> "Scottish Fold"
      # ```
      sig { returns(::String) }
      def self.breed; end

      # Produces a random cat breed registry
      # 
      # ```ruby
      # Faker::Creature::Cat.registry #=> "Fancy Southern Africa Cat Council"
      # ```
      sig { returns(::String) }
      def self.registry; end
    end

    class Dog < Faker::Base
      # Produces a random name for a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.name #=> "Spike"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a random dog breed
      # 
      # ```ruby
      # Faker::Creature::Dog.breed #=> "Yorkshire Terrier"
      # ```
      sig { returns(::String) }
      def self.breed; end

      # Produces a random sound made by a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.sound #=> "woof woof"
      # ```
      sig { returns(::String) }
      def self.sound; end

      # Produces a random dog meme phrase
      # 
      # ```ruby
      # Faker::Creature::Dog.meme_phrase #=> "smol pupperino"
      # ```
      sig { returns(::String) }
      def self.meme_phrase; end

      # Produces a random dog age
      # 
      # ```ruby
      # Faker::Creature::Dog.age #=> "puppy"
      # ```
      sig { returns(::String) }
      def self.age; end

      # Produces a random gender
      # 
      # ```ruby
      # Faker::Creature::Dog.gender #=> "Female"
      # ```
      sig { returns(::String) }
      def self.gender; end

      # Produces a random coat length
      # 
      # ```ruby
      # Faker::Creature::Dog.coat_length #=> "short"
      # ```
      sig { returns(::String) }
      def self.coat_length; end

      # Produces a random size of a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.size #=> "small"
      # ```
      sig { returns(::String) }
      def self.size; end
    end

    class Horse < Faker::Base
      # Produces a random name for a horse
      # 
      # ```ruby
      # Faker::Creature::Horse.name #=> "Noir"
      # ```
      sig { returns(::String) }
      def self.name; end

      # Produces a random horse breed
      # 
      # ```ruby
      # Faker::Creature::Horse.breed #=> "Spanish Barb see Barb Horse"
      # ```
      sig { returns(::String) }
      def self.breed; end
    end

    class Animal < Faker::Base
      # Produces a random animal name
      # 
      # ```ruby
      # Faker::Creature::Animal.name #=> "fly"
      # ```
      sig { returns(::String) }
      def self.name; end
    end
  end

  class Bank < Faker::Base
    # Produces a bank account number.
    # 
    # _@param_ `digits` — Number of digits that the generated account number should have.
    # 
    # ```ruby
    # Faker::Bank.account_number #=> 6738582379
    # Faker::Bank.account_number(digits: 13) #=> 673858237902
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(::String) }
    def self.account_number(legacy_digits = T.unsafe(nil), digits: 10); end

    # Produces a bank iban number.
    # 
    # _@param_ `country_code` — Specifies what country prefix is used to generate the iban code.
    # 
    # ```ruby
    # Faker::Bank.iban #=> "GB76DZJM33188515981979"
    # Faker::Bank.iban(country_code: "be") #=> "BE6375388567752043"
    # ```
    sig { params(legacy_country_code: T.untyped, country_code: ::String).returns(::String) }
    def self.iban(legacy_country_code = T.unsafe(nil), country_code: 'GB'); end

    # Produces a bank name.
    # 
    # ```ruby
    # Faker::Bank.name #=> "ABN AMRO CORPORATE FINANCE LIMITED"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a routing number.
    # 
    # ```ruby
    # Faker::Bank.routing_number #=> "729343831"
    # ```
    sig { returns(::String) }
    def self.routing_number; end

    # Produces a valid routing number.
    # 
    # ```ruby
    # Faker::Bank.routing_number #=> "729343831"
    # ```
    sig { returns(::String) }
    def self.routing_number_with_format; end

    # Produces a swift / bic number.
    # 
    # ```ruby
    # Faker::Bank.swift_bic #=> "AAFMGB21"
    # ```
    sig { returns(::String) }
    def self.swift_bic; end

    # Produces an Australian BSB (Bank-State-Branch) number
    # 
    # ```ruby
    # Faker::Bank.bsb_number
    #   #=> "036616"
    # ```
    sig { returns(::String) }
    def self.bsb_number; end

    sig { params(num_string: T.untyped).returns(T.untyped) }
    def self.checksum(num_string); end

    sig { returns(T.untyped) }
    def self.compile_routing_number; end

    sig { returns(T.untyped) }
    def self.compile_bsb_number; end

    # Calculates the mandatory checksum in 3rd and 4th characters in IBAN format
    # source: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
    sig { params(country_code: T.untyped, account: T.untyped).returns(T.untyped) }
    def self.iban_checksum(country_code, account); end

    sig { returns(T.untyped) }
    def self.valid_routing_number; end

    sig { params(routing_number: T.untyped, checksum: T.untyped).returns(T::Boolean) }
    def self.valid_checksum?(routing_number, checksum); end

    sig { params(routing_num: T.untyped).returns(T.untyped) }
    def self.compile_fraction(routing_num); end

    sig { returns(T.untyped) }
    def self.rand_numstring; end
  end

  class Beer < Faker::Base
    # Produces a random beer name.
    # 
    # ```ruby
    # Faker::Beer.name #=> "Pliny The Elder"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a random beer style.
    # 
    # ```ruby
    # Faker::Beer.style #=> "Wood-aged Beer"
    # ```
    sig { returns(::String) }
    def self.style; end

    # Produces a random beer hops.
    # 
    # ```ruby
    # Faker::Beer.hop #=> "Sterling"
    # ```
    sig { returns(::String) }
    def self.hop; end

    # Produces a random beer yeast.
    # 
    # ```ruby
    # Faker::Beer.yeast #=> "5335 - Lactobacillus"
    # ```
    sig { returns(::String) }
    def self.yeast; end

    # Produces a random beer malt.
    # 
    # ```ruby
    # Faker::Beer.malts #=> "Munich"
    # ```
    sig { returns(::String) }
    def self.malts; end

    # Produces a random beer IBU.
    # 
    # ```ruby
    # Faker::Beer.ibu #=> "87 IBU"
    # ```
    sig { returns(::String) }
    def self.ibu; end

    # Produces a random beer alcohol percentage.
    # 
    # ```ruby
    # Faker::Beer.alcohol #=> "5.4%"
    # ```
    sig { returns(::String) }
    def self.alcohol; end

    # Produces a random beer blg level.
    # 
    # ```ruby
    # Faker::Beer.blg #=> "5.1Blg"
    # ```
    sig { returns(::String) }
    def self.blg; end
  end

  class Code < Faker::Base
    # Produces a random NPI (National Provider Identifer) code.
    # 
    # ```ruby
    # Faker::Code.npi #=> "9804062802"
    # ```
    sig { returns(::String) }
    def self.npi; end

    # Produces a random ISBN (International Standard Book Number) code.
    # 
    # _@param_ `base` — the length of the code to generate (either 10 or 13)
    # 
    # ```ruby
    # Faker::Code.isbn(base: 13) #=> "896579606969-8"
    # ```
    # 
    # ```ruby
    # Faker::Code.isbn #=> "170366802-2"
    # ```
    sig { params(legacy_base: T.untyped, base: Integer).returns(::String) }
    def self.isbn(legacy_base = T.unsafe(nil), base: 10); end

    # Produces a random EAN (European Article Number) code.
    # 
    # _@param_ `base` — the length of the code to generate (either 8 or 13)
    # 
    # ```ruby
    # Faker::Code.ean(base: 8) #=> "36941070"
    # ```
    # 
    # ```ruby
    # Faker::Code.ean #=> "9941880131907"
    # ```
    sig { params(legacy_base: T.untyped, base: Integer).returns(::String) }
    def self.ean(legacy_base = T.unsafe(nil), base: 13); end

    # Produces a random RUT (Rol Unico Nacional) code.
    # 
    # ```ruby
    # Faker::Code.rut #=> "91611842-2"
    # ```
    sig { returns(::String) }
    def self.rut; end

    # By default generates a Singaporean NRIC ID for someone
    # who is born between the age of 18 and 65.
    # 
    # Produces a random NRIC (National Registry Identity Card) code.
    # 
    # _@param_ `min_age` — the min age of the person in years
    # 
    # _@param_ `max_age` — the max age of the person in years
    # 
    # ```ruby
    # Faker::Code.nric(min_age: 25, max_age: 50) #=> "S9347283G"
    # ```
    # 
    # ```ruby
    # Faker::Code.nric(max_age: 55) #=> "S7876903C"
    # ```
    # 
    # ```ruby
    # Faker::Code.nric(min_age: 25) #=> "S6281697Z"
    # ```
    # 
    # ```ruby
    # Faker::Code.nric #=> "S6372958B"
    # ```
    sig do
      params(
        legacy_min_age: T.untyped,
        legacy_max_age: T.untyped,
        min_age: Integer,
        max_age: Integer
      ).returns(::String)
    end
    def self.nric(legacy_min_age = T.unsafe(nil), legacy_max_age = T.unsafe(nil), min_age: 18, max_age: 65); end

    # Produces a random IMEI (International Mobile Equipment Number) code.
    # 
    # ```ruby
    # Faker::Code.imei #=> "492033129092256"
    # ```
    sig { returns(::String) }
    def self.imei; end

    # Retrieves a real Amazon ASIN code from https://archive.org/details/asin_listing
    # 
    # ```ruby
    # Faker::Code.asin #=> "B000MZW1GE"
    # ```
    sig { returns(::String) }
    def self.asin; end

    # Produces a random SIN (Social Insurance Number for Canada) code.
    # 
    # ```ruby
    # Faker::Code.sin #=> "996586962"
    # ```
    sig { returns(::String) }
    def self.sin; end

    sig { returns(T.untyped) }
    def self.generate_imei; end

    sig { returns(T.untyped) }
    def self.generate_base10_isbn; end

    sig { returns(T.untyped) }
    def self.generate_base13_isbn; end

    sig { params(values: T.untyped).returns(T.untyped) }
    def self.sum(values); end

    sig { returns(T.untyped) }
    def self.generate_base8_ean; end

    sig { returns(T.untyped) }
    def self.generate_base13_ean; end

    sig { params(rut: T.untyped).returns(T.untyped) }
    def self.rut_verificator_digit(rut); end

    sig { params(values: T.untyped, prefix: T.untyped).returns(T.untyped) }
    def self.generate_nric_check_alphabet(values, prefix); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.generate_sin_check_digit(digits); end
  end

  class Coin < Faker::Base
    # Retrieves a random coin from any country.
    # 
    # ```ruby
    # Faker::Coin.name #=> "Brazilian Real"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Retrieves a face to a flipped coin
    # 
    # ```ruby
    # Faker::Coin.flip #=> "Heads"
    # ```
    sig { returns(::String) }
    def self.flip; end
  end

  class Date < Faker::Base
    # Produce a random date between two dates.
    # 
    # _@param_ `from` — The start of the usable date range.
    # 
    # _@param_ `to` — The end of the usable date range.
    # 
    # if used with or without Rails (Active Support)
    # ```ruby
    # Faker::Date.between(from: '2014-09-23', to: '2014-09-25') #=> #<Date: 2014-09-24>
    # ```
    # 
    # if used with Rails (Active Support)
    # ```ruby
    # Faker::Date.between(from: 2.days.ago, to: ::Date.today) #=> #<Date: 2014-09-24>
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.any(::Date, ::String),
        to: T.any(::Date, ::String)
      ).returns(::Date)
    end
    def self.between(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from:, to:); end

    # Produce a random date between two dates.
    # 
    # _@param_ `from` — The start of the usable date range.
    # 
    # _@param_ `to` — The end of the usable date range.
    # 
    # _@param_ `excepted` — A date to exclude.
    # 
    # if used with or without Rails (Active Support)
    # ```ruby
    # Faker::Date.between_except(from: '2014-09-23', to: '2015-09-25', excepted: '2015-01-24') #=> #<Date: 2014-10-03>
    # ```
    # 
    # if used with Rails (Active Support)
    # ```ruby
    # Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: ::Date.today) #=> #<Date: 2014-10-03>
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_excepted: T.untyped,
        from: T.any(::Date, ::String),
        to: T.any(::Date, ::String),
        excepted: T.any(::Date, ::String)
      ).returns(::Date)
    end
    def self.between_except(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), legacy_excepted = T.unsafe(nil), from:, to:, excepted:); end

    # Produce a random date in the future (up to N days).
    # 
    # _@param_ `days` — The maximum number of days to go into the future.
    # 
    # ```ruby
    # Faker::Date.forward(days: 23) #=> #<Date: 2014-10-03>
    # ```
    sig { params(legacy_days: T.untyped, days: Integer).returns(::Date) }
    def self.forward(legacy_days = T.unsafe(nil), days: 365); end

    # Produce a random date in the past (up to N days).
    # 
    # _@param_ `days` — The maximum number of days to go into the past.
    # 
    # ```ruby
    # Faker::Date.backward(days: 14) #=> #<Date: 2019-09-12>
    # ```
    sig { params(legacy_days: T.untyped, days: Integer).returns(::Date) }
    def self.backward(legacy_days = T.unsafe(nil), days: 365); end

    # Produce a random date in the past (up to N days).
    # 
    # _@param_ `min_age` — The minimum age that the birthday would imply.
    # 
    # _@param_ `max_age` — The maximum age that the birthday would imply.
    # 
    # ```ruby
    # Faker::Date.birthday(min_age: 18, max_age: 65) #=> #<Date: 1986-03-28>
    # ```
    sig do
      params(
        legacy_min_age: T.untyped,
        legacy_max_age: T.untyped,
        min_age: Integer,
        max_age: Integer
      ).returns(::Date)
    end
    def self.birthday(legacy_min_age = T.unsafe(nil), legacy_max_age = T.unsafe(nil), min_age: 18, max_age: 65); end

    # Produces a date in the year and/or month specified.
    # 
    # _@param_ `month` — represents the month of the date
    # 
    # _@param_ `year` — represents the year of the date
    # 
    # ```ruby
    # Faker::Date.in_date_period #=> #<Date: 2019-09-01>
    # ```
    # 
    # ```ruby
    # Faker::Date.in_date_period(year: 2018, month: 2) #=> #<Date: 2018-02-26>
    # ```
    # 
    # ```ruby
    # Faker::Date.in_date_period(month: 2) #=> #<Date: 2019-02-26>
    # ```
    sig { params(month: T.nilable(Integer), year: Integer).returns(::Date) }
    def self.in_date_period(month: nil, year: ::Date.today.year); end

    sig { params(date: T.untyped, age: T.untyped).returns(T.untyped) }
    def self.birthday_date(date, age); end

    sig { params(date: T.untyped).returns(T.untyped) }
    def self.get_date_object(date); end
  end

  class File < Faker::Base
    # Produces a random directory name.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `segment_count` — Specifies the number of nested folders in the generated string.
    # 
    # _@param_ `root` — Specifies the root of the generated string.
    # 
    # _@param_ `directory_separator` — Specifies the separator between the segments.
    # 
    # ```ruby
    # Faker::File.dir #=> "et_error/sint_voluptas/quas_veritatis"
    # Faker::File.dir(segment_count: 2) #=> "ea-suscipit/ut-deleniti"
    # Faker::File.dir(segment_count: 3, root: nil, directory_separator: '/') #=> "est_porro/fugit_eveniet/incidunt-autem"
    # Faker::File.dir(segment_count: 3, root: nil, directory_separator: '\\') #=> "aut-ullam\\quia_quisquam\\ut-eos"
    # ```
    sig do
      params(
        legacy_segment_count: T.untyped,
        legacy_root: T.untyped,
        legacy_directory_separator: T.untyped,
        segment_count: Integer,
        root: T.nilable(::String),
        directory_separator: ::String
      ).returns(::String)
    end
    def self.dir(legacy_segment_count = T.unsafe(nil), legacy_root = T.unsafe(nil), legacy_directory_separator = T.unsafe(nil), segment_count: 3, root: nil, directory_separator: ::File::Separator); end

    # Produces a random file extension.
    # 
    # ```ruby
    # Faker::File.extension #=> "mp3"
    # ```
    sig { returns(::String) }
    def self.extension; end

    # Produces a random mime type.
    # 
    # ```ruby
    # Faker::File.mime_type #=> "application/pdf"
    # ```
    sig { returns(::String) }
    def self.mime_type; end

    # Produces a random file name.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `dir` — Specifies the path used for the generated file.
    # 
    # _@param_ `name` — Specifies the filename used for the generated file.
    # 
    # _@param_ `ext` — Specifies the extension used the generated file.
    # 
    # _@param_ `directory_separator` — Specifies the separator between the directory and name elements.
    # 
    # ```ruby
    # Faker::File.file_name(dir: 'path/to') #=> "path/to/something_random.jpg"
    # Faker::File.file_name(dir: 'foo/bar', name: 'baz') #=> "foo/bar/baz.zip"
    # Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'doc') #=> "foo/bar/baz.doc"
    # Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'mp3', directory_separator: '\\') #=> "foo/bar\\baz.mp3"
    # ```
    sig do
      params(
        legacy_dir: T.untyped,
        legacy_name: T.untyped,
        legacy_ext: T.untyped,
        legacy_directory_separator: T.untyped,
        dir: T.nilable(::String),
        name: T.nilable(::String),
        ext: T.nilable(::String),
        directory_separator: ::String
      ).returns(::String)
    end
    def self.file_name(legacy_dir = T.unsafe(nil), legacy_name = T.unsafe(nil), legacy_ext = T.unsafe(nil), legacy_directory_separator = T.unsafe(nil), dir: nil, name: nil, ext: nil, directory_separator: ::File::Separator); end
  end

  class Food < Faker::Base
    # Retrieves a typical dish from each country.
    # 
    # ```ruby
    # Faker::Food.dish #=> "Feijoada"
    # ```
    sig { returns(::String) }
    def self.dish; end

    # Retrieves a description about some dish
    # 
    # ```ruby
    # Faker::Food.description #=> "Breaded fried chicken with waffles. Served with maple syrup."
    # ```
    sig { returns(::String) }
    def self.description; end

    # Retrieves an ingredient
    # 
    # ```ruby
    # Faker::Food.ingredient #=> "Olives"
    # ```
    sig { returns(::String) }
    def self.ingredient; end

    # Retrieves a fruit
    # 
    # ```ruby
    # Faker::Food.fruits #=> "Papaya"
    # ```
    sig { returns(::String) }
    def self.fruits; end

    # Retrieves a vegetable
    # 
    # ```ruby
    # Faker::Food.vegetables #=> "Broccolini"
    # ```
    sig { returns(::String) }
    def self.vegetables; end

    # Retrieves some random spice
    # 
    # ```ruby
    # Faker::Food.spice #=> "Garlic Chips"
    # ```
    sig { returns(::String) }
    def self.spice; end

    # Retrieves cooking measures
    # 
    # ```ruby
    # Faker::Food.measurement #=> "1/3"
    # ```
    sig { returns(::String) }
    def self.measurement; end

    # Retrieves metric mesurements
    # 
    # ```ruby
    # Faker::Food.metric_measurement #=> "centiliter"
    # ```
    sig { returns(::String) }
    def self.metric_measurement; end
  end

  class Json < Faker::Base
    # Produces a random simple JSON formatted string.
    # 
    # _@param_ `width` — Specifies the number of key-value pairs.
    # 
    # _@param_ `options` — Specifies a Faker gem class to use for keys and for values, respectably. options_hash = {key: Class.method, value: Class.method}
    # 
    # ```ruby
    # Faker::Json.shallow_json(width: 3, options: { key: 'RockBand.name', value: 'Seinfeld.quote' }) # =>
    #   {"Parliament Funkadelic":"They're real, and they're spectacular.",
    #   "Fleetwood Mac":"I'm not a lesbian. I hate men, but I'm not a lesbian.",
    #   "The Roots":"It became very clear to me sitting out there today that every decision
    #   I've made in my entire life has been wrong. My life is the complete opposite of everything
    #   I want it to be. Every instinct I have, in every aspect of life, be it something to wear,
    #   something to eat - it's all been wrong."}
    # ```
    sig do
      params(
        legacy_width: T.untyped,
        legacy_options: T.untyped,
        width: Integer,
        options: T::Hash[T.untyped, T.untyped]
      ).returns(T::Hash[String, String])
    end
    def self.shallow_json(legacy_width = T.unsafe(nil), legacy_options = T.unsafe(nil), width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' }); end

    # Produces a random nested JSON formatted string that can take JSON as an additional argument.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `json` — Specifies a Json.shallow_json and uses its keys as keys of the nested JSON.
    # 
    # _@param_ `width` — Specifies the number of nested key-value pairs.
    # 
    # _@param_ `options` — Specifies a Faker gem class to use for nested keys and for values, respectably. options_hash = {key: Class.method, value: Class.method}
    # 
    # ```ruby
    # json = Faker::Json.shallow_json(width: 3, options: { key: 'Name.first_name', value: 'Name.last_name' })
    # puts json # =>
    #   {"Alisha":"Olson","Everardo":"DuBuque","Bridgette":"Turner"}
    # 
    # json2 = Faker::Json.add_depth_to_json(json: json, width: 2, options: { key: 'Name.first_name', value: 'Name.last_name' })
    # puts json2 # =>
    #   {"Alisha":{"Daisy":"Trantow","Oda":"Haag"},
    #    "Everardo":{"Javier":"Marvin","Eliseo":"Schuppe"},
    #    "Bridgette":{"Jorge":"Kertzmann","Lelah":"MacGyver"}}
    # 
    #  json3 = Faker::Json.add_depth_to_json(json: json2, width: 4, options: { key: 'Name.first_name', value: 'Name.last_name' })
    #    puts json3 # =>
    #      {"Alisha":
    #        {"Daisy":
    #          {"Bulah":"Wunsch","Cristian":"Champlin","Lester":"Bartoletti","Greg":"Jacobson"},
    #         "Oda":
    #           {"Salvatore":"Kuhlman","Aubree":"Okuneva","Larry":"Schmitt","Velva":"Gibson"}},
    #       "Everardo":
    #         {"Javier":
    #           {"Eduardo":"Orn","Laila":"Kub","Thad":"Legros","Dion":"Wilderman"},
    #         "Eliseo":
    #           {"Olin":"Hilpert","Marisa":"Greenfelder","Karlee":"Schmitt","Judd":"Larkin"}},
    #       "Bridgette":
    #         {"Jorge":
    #           {"Eloy":"Pfeffer","Kody":"Hansen","Paxton":"Lubowitz","Abe":"Lesch"},
    #         "Lelah":
    #           {"Rick":"Wiza","Bonita":"Bayer","Gardner":"Auer","Felicity":"Abbott"}}}
    # ```
    sig do
      params(
        legacy_json: T.untyped,
        legacy_width: T.untyped,
        legacy_options: T.untyped,
        json: T::Hash[String, String],
        width: Integer,
        options: T::Hash[T.untyped, T.untyped]
      ).returns(T::Hash[String, String])
    end
    def self.add_depth_to_json(legacy_json = T.unsafe(nil), legacy_width = T.unsafe(nil), legacy_options = T.unsafe(nil), json: shallow_json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' }); end

    sig { params(width: T.untyped, options: T.untyped).returns(T.untyped) }
    def self.build_shallow_hash(width, options); end

    sig do
      params(
        hash: T.untyped,
        key_array: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.add_hash_to_bottom(hash, key_array, width, options); end

    sig do
      params(
        key_array: T.untyped,
        hash: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.add_hash(key_array, hash, width, options); end

    sig { params(key_array: T.untyped).returns(T.untyped) }
    def self.build_keys_from_array(key_array); end
  end

  class Kpop < Faker::Base
    # Produces the name of a 1990's 'OG' K-Pop group.
    # 
    # ```ruby
    # Faker::Kpop.i_groups #=> "Seo Taiji and Boys"
    # ```
    sig { returns(::String) }
    def self.i_groups; end

    # Produces the name of a 2000's K-Pop group.
    # 
    # ```ruby
    # Faker::Kpop.ii_groups #=> "Girls' Generation"
    # ```
    sig { returns(::String) }
    def self.ii_groups; end

    # Produces the name of a 2010's K-Pop group.
    # 
    # ```ruby
    # Faker::Kpop.iii_groups #=> "Trouble Maker"
    # ```
    sig { returns(::String) }
    def self.iii_groups; end

    # Produces the name of a K-Pop girl group.
    # 
    # ```ruby
    # Faker::Kpop.girl_groups #=> "2NE1"
    # ```
    sig { returns(::String) }
    def self.girl_groups; end

    # Produces the name of a K-Pop boy band.
    # 
    # ```ruby
    # Faker::Kpop.boy_bands #=> "Exo"
    # ```
    sig { returns(::String) }
    def self.boy_bands; end

    # Produces the name of a solo K-Pop artist.
    # 
    # ```ruby
    # Faker::Kpop.solo #=> "T.O.P"
    # ```
    sig { returns(::String) }
    def self.solo; end
  end

  class Name < Faker::Base
    # Produces a random name.
    # 
    # ```ruby
    # Faker::Name.name #=> "Tyshawn Johns Sr."
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a random name with middle name.
    # 
    # ```ruby
    # Faker::Name.name_with_middle #=> "Aditya Elton Douglas"
    # ```
    sig { returns(::String) }
    def self.name_with_middle; end

    # Produces a random first name.
    # 
    # ```ruby
    # Faker::Name.first_name #=> "Kaci"
    # ```
    sig { returns(::String) }
    def self.first_name; end

    # Produces a random male first name.
    # 
    # ```ruby
    # Faker::Name.male_first_name #=> "Edward"
    # ```
    sig { returns(::String) }
    def self.male_first_name; end

    # Produces a random female first name.
    # 
    # ```ruby
    # Faker::Name.female_first_name #=> "Natasha"
    # ```
    sig { returns(::String) }
    def self.female_first_name; end

    # Produces a random gender neutral first name.
    # 
    # ```ruby
    # Faker::Name.neutral_first_name #=> "Casey"
    # ```
    sig { returns(::String) }
    def self.neutral_first_name; end

    # Produces a random last name.
    # 
    # ```ruby
    # Faker::Name.last_name #=> "Ernser"
    # ```
    sig { returns(::String) }
    def self.last_name; end

    # Produces a random name prefix.
    # 
    # ```ruby
    # Faker::Name.prefix #=> "Mr."
    # ```
    sig { returns(::String) }
    def self.prefix; end

    # Produces a random name suffix.
    # 
    # ```ruby
    # Faker::Name.suffix #=> "IV"
    # ```
    sig { returns(::String) }
    def self.suffix; end

    # Produces random initials.
    # 
    # _@param_ `number` — Number of digits that the generated initials should have.
    # 
    # ```ruby
    # Faker::Name.initials            #=> "NJM"
    # Faker::Name.initials(number: 2) #=> "NM"
    # ```
    sig { params(legacy_number: T.untyped, number: Integer).returns(::String) }
    def self.initials(legacy_number = T.unsafe(nil), number: 3); end
  end

  class Team < Faker::Base
    # Produces a team name from a state and a creature.
    # 
    # ```ruby
    # Faker::Team.name #=> "Oregon vixens"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a team creature.
    # 
    # ```ruby
    # Faker::Team.creature #=> "geese"
    # ```
    sig { returns(::String) }
    def self.creature; end

    # Produces a team state.
    # 
    # ```ruby
    # Faker::Team.state #=> "Oregon"
    # ```
    sig { returns(::String) }
    def self.state; end

    # Produces a team sport.
    # 
    # ```ruby
    # Faker::Team.sport #=> "Lacrosse"
    # ```
    sig { returns(::String) }
    def self.sport; end

    # Produces the name of a team mascot.
    # 
    # ```ruby
    # Faker::Team.mascot #=> "Hugo"
    # ```
    sig { returns(::String) }
    def self.mascot; end
  end

  class Time < Faker::Base
    # Produce a random time between two times.
    # 
    # _@param_ `from` — The start of the usable time range.
    # 
    # _@param_ `to` — The end of the usable time range.
    # 
    # _@param_ `format` — The name of a DateTime format to use.
    # 
    # ```ruby
    # # Random Stringified time between two times, formatted to the specified I18n format
    # # (Examples are from a Rails console with rails-i18n 5.1.1 defaults loaded)
    # I18n.locale = 'en-US'
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :default) #=> "Tue, 16 Oct 2018 10:48:27 AM -05:00"
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :short) #=> "15 Oct 10:48 AM"
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :long) #=> "October 15, 2018 10:48 AM"
    # 
    # I18n.locale = 'ja'
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :default) #=> "2018/10/15 10:48:27"
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :short) #=> "18/10/15 10:48"
    # Faker::Time.between(from: ::DateTime.now - 1, to: ::DateTime.now, format: :long) #=> "2018年10月16日(火) 10時48分27秒 -0500"
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_format: T.untyped,
        from: T.any(Time, T.untyped, DateTime),
        to: T.any(Time, T.untyped, DateTime),
        format: T.nilable(Symbol)
      ).returns(Time)
    end
    def self.between(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), legacy_format = T.unsafe(nil), from:, to:, format: nil); end

    # Produce a random time between two dates.
    # 
    # _@param_ `from` — The start of the usable time range.
    # 
    # _@param_ `to` — The end of the usable time range.
    # 
    # _@param_ `period` — The time of day, if any. See {TIME_RANGES}.
    # 
    # _@param_ `format` — The name of a DateTime format to use.
    # 
    # ```ruby
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :all)
    #   #=> "2014-09-19 07:03:30 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :day)
    #   #=> "2014-09-18 16:28:13 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :night)
    #   #=> "2014-09-20 19:39:38 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :morning)
    #   #=> "2014-09-19 08:07:52 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :afternoon)
    #   #=> "2014-09-18 12:10:34 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :evening)
    #   #=> "2014-09-19 20:21:03 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 1, to: ::Date.today, period: :midnight)
    #   #=> "2014-09-20 00:40:14 -0700"
    # Faker::Time.between_dates(from: ::Date.today - 5, to: ::Date.today + 5, period: :afternoon, format: :default)
    #   #=> "Fri, 19 Oct 2018 15:17:46 -0500"
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        from: T.untyped,
        to: T.untyped,
        period: Symbol,
        format: T.nilable(Symbol)
      ).returns(Time)
    end
    def self.between_dates(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), legacy_period = T.unsafe(nil), legacy_format = T.unsafe(nil), from:, to:, period: :all, format: nil); end

    # Produce a random time in the future (up to N days).
    # 
    # _@param_ `days` — The maximum number of days to go into the future.
    # 
    # _@param_ `period` — The time of day, if any. See {TIME_RANGES}.
    # 
    # _@param_ `format` — The name of a DateTime format to use.
    # 
    # ```ruby
    # Faker::Time.forward(days: 23, period: :morning)
    #   # => "2014-09-26 06:54:47 -0700"
    # Faker::Time.forward(days: 5,  period: :evening, format: :long)
    #   #=> "October 21, 2018 20:47"
    # ```
    sig do
      params(
        legacy_days: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        days: Integer,
        period: Symbol,
        format: T.nilable(Symbol)
      ).returns(Time)
    end
    def self.forward(legacy_days = T.unsafe(nil), legacy_period = T.unsafe(nil), legacy_format = T.unsafe(nil), days: 365, period: :all, format: nil); end

    # Produce a random time in the past (up to N days).
    # 
    # _@param_ `days` — The maximum number of days to go into the past.
    # 
    # _@param_ `period` — The time of day, if any. See {TIME_RANGES}.
    # 
    # _@param_ `format` — The name of a DateTime format to use.
    # 
    # ```ruby
    # Faker::Time.backward(days: 14, period: :evening)
    #   #=> "2014-09-17 19:56:33 -0700"
    # Faker::Time.backward(days: 5, period: :morning, format: :short)
    #   #=> "14 Oct 07:44"
    # ```
    sig do
      params(
        legacy_days: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        days: Integer,
        period: Symbol,
        format: T.nilable(Symbol)
      ).returns(Time)
    end
    def self.backward(legacy_days = T.unsafe(nil), legacy_period = T.unsafe(nil), legacy_format = T.unsafe(nil), days: 365, period: :all, format: nil); end

    sig { params(date: T.untyped, period: T.untyped).returns(T.untyped) }
    def self.date_with_random_time(date, period); end

    sig { params(time: T.untyped, format: T.untyped).returns(T.untyped) }
    def self.time_with_format(time, format); end

    sig { params(period: T.untyped).returns(T.untyped) }
    def self.hours(period); end

    sig { returns(T.untyped) }
    def self.minutes; end

    sig { returns(T.untyped) }
    def self.seconds; end

    sig { params(time: T.untyped).returns(T.untyped) }
    def self.get_time_object(time); end
  end

  class Verb < Faker::Base
    # Produces the base form of a random verb.
    # 
    # ```ruby
    # Faker::Verb.base #=> "hurt"
    # ```
    sig { returns(::String) }
    def self.base; end

    # Produces a random verb in past tense.
    # 
    # ```ruby
    # Faker::Verb.past #=> "completed"
    # ```
    sig { returns(::String) }
    def self.past; end

    # Produces a random verb in past participle.
    # 
    # ```ruby
    # Faker::Verb.past_participle #=> "digested"
    # ```
    sig { returns(::String) }
    def self.past_participle; end

    # Produces a random verb in simple present.
    # 
    # ```ruby
    # Faker::Verb.simple_present #=> "climbs"
    # ```
    sig { returns(::String) }
    def self.simple_present; end

    # Produces a random verb in the .ing form.
    # 
    # ```ruby
    # Faker::Verb.ing_form #=> "causing"
    # ```
    sig { returns(::String) }
    def self.ing_form; end
  end

  class Movie < Faker::Base
    # Produces a title from a movie.
    # 
    # ```ruby
    # Faker::Movie.title #=> "The Lord of the Rings: The Two Towers"
    # ```
    sig { returns(::String) }
    def self.title; end

    # Produces a quote from a movie.
    # 
    # ```ruby
    # Faker::Movie.quote #=> "Bumble bee tuna"
    # ```
    sig { returns(::String) }
    def self.quote; end
  end

  class Quote < Faker::Base
    # Produces a famous last words quote.
    # 
    # ```ruby
    # Faker::Quote.famous_last_words #=> "My vocabulary did this to me. Your love will let you go on..."
    # ```
    sig { returns(::String) }
    def self.famous_last_words; end

    # Produces a quote from Deep Thoughts by Jack Handey.
    # 
    # ```ruby
    # Faker::Quote.jack_handey # => "I hope life isn't a big joke, because I don't get it."
    # ```
    sig { returns(::String) }
    def self.jack_handey; end

    # Produces a quote from Matz.
    # 
    # ```ruby
    # Faker::Quote.matz #=> "You want to enjoy life, don't you? If you get your job done quickly and your job is fun, that's good isn't it? That's the purpose of life, partly. Your life is better."
    # ```
    sig { returns(::String) }
    def self.matz; end

    # Produces a quote about the most interesting man in the world.
    # 
    # ```ruby
    # Faker::Quote.most_interesting_man_in_the_world #=> "He can speak Russian... in French"
    # ```
    sig { returns(::String) }
    def self.most_interesting_man_in_the_world; end

    # Produces a Robin quote.
    # 
    # ```ruby
    # Faker::Quote.robin #=> "Holy Razors Edge"
    # ```
    sig { returns(::String) }
    def self.robin; end

    # Produces a singular siegler quote.
    # 
    # ```ruby
    # Faker::Quote.singular_siegler #=> "Texas!"
    # ```
    sig { returns(::String) }
    def self.singular_siegler; end

    # Produces a quote from Yoda.
    # 
    # ```ruby
    # Faker::Quote.yoda #=> "Use your feelings, Obi-Wan, and find him you will."
    # ```
    sig { returns(::String) }
    def self.yoda; end

    # Produces a quote from a fortune cookie.
    # 
    # ```ruby
    # Faker::Quote.fortune_cookie #=> "This cookie senses that you are superstitious; it is an inclination that is bad for your mental health."
    # ```
    sig { returns(::String) }
    def self.fortune_cookie; end
  end

  class Blood < Faker::Base
    # Produces a random blood type.
    # 
    # ```ruby
    # Faker::Blood.type #=> "AB"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces a random blood RH-Factor.
    # 
    # ```ruby
    # Faker::Blood.rh_factor #=> "-"
    # ```
    sig { returns(::String) }
    def self.rh_factor; end

    # Produces a random blood group name.
    # 
    # ```ruby
    # Faker::Blood.group #=> "AB-"
    # ```
    sig { returns(::String) }
    def self.group; end
  end

  class Color < Faker::Base
    # Produces a hex color code.
    # 
    # ```ruby
    # Faker::Color.hex_color #=> "#31a785"
    # ```
    sig { returns(::String) }
    def self.hex_color; end

    # Produces the name of a color.
    # 
    # ```ruby
    # Faker::Color.color_name #=> "yellow"
    # ```
    sig { returns(::String) }
    def self.color_name; end

    sig { returns(T.untyped) }
    def self.single_rgb_color; end

    # Produces an array of integers representing an RGB color.
    # 
    # ```ruby
    # Faker::Color.rgb_color #=> [54, 233, 67]
    # ```
    sig { returns([Integer, Integer, Integer]) }
    def self.rgb_color; end

    # Produces an array of floats representing an HSL color.
    # The array is in the form of `[hue, saturation, lightness]`.
    # 
    # ```ruby
    # Faker::Color.hsl_color #=> [69.87, 0.66, 0.3]
    # ```
    sig { returns([Float, Float, Float]) }
    def self.hsl_color; end

    # Produces an array of floats representing an HSLA color.
    # The array is in the form of `[hue, saturation, lightness, alpha]`.
    # 
    # ```ruby
    # Faker::Color.hsla_color #=> [154.77, 0.36, 0.9, 0.2]
    # ```
    sig { returns([Float, Float, Float, Float]) }
    def self.hsla_color; end
  end

  class Drone < Faker::Base
    # Returns random drone name with company
    # 
    # ```ruby
    # Faker::Drone.name #=> "DJI Mavic Air 2"
    # ```
    sig { returns(T.untyped) }
    def self.name; end

    # Returns total drone weight in grams
    # 
    # ```ruby
    # Faker::Drone.weight #=> "570 g"
    # ```
    sig { returns(::String) }
    def self.weight; end

    # Returns maximum ascent speed for drone in m/s
    # 
    # ```ruby
    # Faker::Drone.max_ascent_speed #=> "4 m/s"
    # ```
    sig { returns(::String) }
    def self.max_ascent_speed; end

    # Returns maximum descent speed for drone in m/s
    # 
    # ```ruby
    # Faker::Drone.max_descent_speed #=> "4 m/s"
    # ```
    sig { returns(::String) }
    def self.max_descent_speed; end

    # Returns max flight time for drone in optimal conditions
    # 
    # ```ruby
    # Faker::Drone.flight_time #=> "34 min"
    # ```
    sig { returns(::String) }
    def self.flight_time; end

    # Returns max altitude drone can go above sea level in meters
    # 
    # ```ruby
    # Faker::Drone.max_altitude #=> "5000 m"
    # ```
    sig { returns(::String) }
    def self.max_altitude; end

    # Returns how far drone can go in optimal condition when full charged in meters
    # 
    # ```ruby
    # Faker::Drone.max_flight_distance #=> "18500 m"
    # ```
    sig { returns(::String) }
    def self.max_flight_distance; end

    # Returns max horizontal speed by drone in m/s
    # 
    # ```ruby
    # Faker::Drone.max_speed #=> "19 m/s"
    # ```
    sig { returns(::String) }
    def self.max_speed; end

    # Returns max wind resistance by drone in m/s
    # 
    # ```ruby
    # Faker::Drone.max_wind_resistance #=> "10.5 m/s"
    # ```
    sig { returns(::String) }
    def self.max_wind_resistance; end

    # Returns max angular velocity of drone in degrees/s
    # 
    # ```ruby
    # Faker::Drone.max_angular_velocity #=> "250 degree/s"
    # ```
    sig { returns(::String) }
    def self.max_angular_velocity; end

    # Returns max tilt angle drone can go in degrees
    # 
    # ```ruby
    # Faker::Drone.max_tilt_angle #=> "35 degrees"
    # ```
    sig { returns(::String) }
    def self.max_tilt_angle; end

    # Returns operating temprature for drone in Fahrenheit
    # 
    # ```ruby
    # Faker::Drone.operating_temperature #=> "14-104F"
    # ```
    sig { returns(::String) }
    def self.operating_temperature; end

    # Returns the drone battery capacity
    # 
    # ```ruby
    # Faker::Drone.battery_capacity #=> "3500 mAh"
    # ```
    sig { returns(::String) }
    def self.battery_capacity; end

    # Returns battery voltage
    # 
    # ```ruby
    # Faker::Drone.battery_voltage #=> "13.2V"
    # ```
    sig { returns(::String) }
    def self.battery_voltage; end

    # Returns the battery type
    # 
    # ```ruby
    # Faker::Drone.battery_type #=> "LiPo 4S"
    # ```
    sig { returns(::String) }
    def self.battery_type; end

    # Returns total battery weight in grams
    # 
    # ```ruby
    # Faker::Drone.battery_weight #=> "198 g"
    # ```
    sig { returns(::String) }
    def self.battery_weight; end

    # Returns charging temperature for battery in Fahrenheit
    # 
    # ```ruby
    # Faker::Drone.charging_temperature #=> "41-104F"
    # ```
    sig { returns(::String) }
    def self.charging_temperature; end

    # Returns max chargin power required for battery
    # 
    # ```ruby
    # Faker::Drone.max_charging_power #=> "38W"
    # ```
    sig { returns(::String) }
    def self.max_charging_power; end

    # Returns camera ISO range for drone
    # 
    # ```ruby
    # Faker::Drone.iso #=> "100-3200"
    # ```
    sig { returns(::String) }
    def self.iso; end

    # Returns max camera resolution in MP"
    # 
    # ```ruby
    # Faker::Drone.max_resolution #=> "48MP"
    # ```
    sig { returns(::String) }
    def self.max_resolution; end

    # Returns photo format for drone
    # 
    # ```ruby
    # Faker::Drone.photo_format #=> "JPEG"
    # ```
    sig { returns(::String) }
    def self.photo_format; end

    # Returns video format
    # 
    # ```ruby
    # Faker::Drone.video_format #=> "MP4"
    # ```
    sig { returns(::String) }
    def self.video_format; end

    # Returns max and min shutter speed for camera
    # 
    # ```ruby
    # Faker::Drone.shutter_speed_range #=> "8-1/8000s"
    # ```
    sig { returns(::String) }
    def self.shutter_speed_range; end

    # Returns max shutter speed for camera
    # 
    # ```ruby
    # Faker::Drone.max_shutter_speed #=> "60s"
    # ```
    sig { returns(::String) }
    def self.max_shutter_speed; end

    # Returns min shutter speed for camera
    # 
    # ```ruby
    # Faker::Drone.min_shutter_speed #=> "1/8000s"
    # ```
    sig { returns(::String) }
    def self.min_shutter_speed; end
  end

  class House < Faker::Base
    # Produces the name of a piece of furniture.
    # 
    # ```ruby
    # Faker::House.furniture #=> "chair"
    # ```
    sig { returns(::String) }
    def self.furniture; end

    # Produces the name of a room in a house.
    # 
    # ```ruby
    # Faker::House.room #=> "kitchen"
    # ```
    sig { returns(::String) }
    def self.room; end
  end

  # Based on Perl's Text::Lorem
  class Lorem < Faker::Base
    sig { returns(T.untyped) }
    def self.word; end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.words(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    sig { returns(T.untyped) }
    def self.character; end

    # Produces a random string of alphanumeric characters
    # 
    # _@param_ `number` — The number of characters to generate
    # 
    # _@param_ `min_alpha` — The minimum number of alphabetic to add to the string
    # 
    # _@param_ `min_numeric` — The minimum number of numbers to add to the string
    # 
    # ```ruby
    # Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5w..."
    # Faker::Lorem.characters(number: 10) #=> "ang9cbhoa8"
    # Faker::Lorem.characters(number: 10, min_alpha: 4) #=> "ang9cbhoa8"
    # Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) #=> "ang9cbhoa8"
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        number: Integer,
        min_alpha: Integer,
        min_numeric: Integer
      ).returns(::String)
    end
    def self.characters(legacy_number = T.unsafe(nil), number: 255, min_alpha: 0, min_numeric: 0); end

    sig { returns(T.untyped) }
    def self.multibyte; end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: T.untyped,
        supplemental: T.untyped,
        random_words_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.sentence(legacy_word_count = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_random_words_to_add = T.unsafe(nil), word_count: 4, supplemental: false, random_words_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.sentences(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_sentence_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_sentences_to_add: T.untyped,
        sentence_count: T.untyped,
        supplemental: T.untyped,
        random_sentences_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph(legacy_sentence_count = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_random_sentences_to_add = T.unsafe(nil), sentence_count: 3, supplemental: false, random_sentences_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraphs(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph_by_chars(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 256, supplemental: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: T.untyped,
        supplemental: T.untyped,
        random_words_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.question(legacy_word_count = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_random_words_to_add = T.unsafe(nil), word_count: 4, supplemental: false, random_words_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.questions(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    sig { returns(T.untyped) }
    def self.locale_period; end

    sig { returns(T.untyped) }
    def self.locale_space; end

    sig { returns(T.untyped) }
    def self.locale_question_mark; end
  end

  class Space < Faker::Base
    # Produces the name of a planet.
    # 
    # ```ruby
    # Faker::Space.planet #=> "Venus"
    # ```
    sig { returns(::String) }
    def self.planet; end

    # Produces the name of a moon.
    # 
    # ```ruby
    # Faker::Space.moon #=> "Europa"
    # ```
    sig { returns(::String) }
    def self.moon; end

    # Produces the name of a galaxy.
    # 
    # ```ruby
    # Faker::Space.galaxy #=> "Andromeda"
    # ```
    sig { returns(::String) }
    def self.galaxy; end

    # Produces the name of a nebula.
    # 
    # ```ruby
    # Faker::Space.nebula #=> "Triffid Nebula"
    # ```
    sig { returns(::String) }
    def self.nebula; end

    # Produces the name of a star cluster.
    # 
    # ```ruby
    # Faker::Space.star_cluster #=> "Messier 70"
    # ```
    sig { returns(::String) }
    def self.star_cluster; end

    # Produces the name of a constellation.
    # 
    # ```ruby
    # Faker::Space.constellation #=> "Orion"
    # ```
    sig { returns(::String) }
    def self.constellation; end

    # Produces the name of a star.
    # 
    # ```ruby
    # Faker::Space.star #=> "Proxima Centauri"
    # ```
    sig { returns(::String) }
    def self.star; end

    # Produces the name of a space agency.
    # 
    # ```ruby
    # Faker::Space.agency #=> "Japan Aerospace Exploration Agency"
    # ```
    sig { returns(::String) }
    def self.agency; end

    # Produces a space agency abbreviation.
    # 
    # ```ruby
    # Faker::Space.agency_abv #=> "NASA"
    # ```
    sig { returns(::String) }
    def self.agency_abv; end

    # Produces the name of a NASA spacecraft.
    # 
    # ```ruby
    # Faker::Space.nasa_space_craft #=> "Endeavour"
    # ```
    sig { returns(::String) }
    def self.nasa_space_craft; end

    # Produces the name of a space company.
    # 
    # ```ruby
    # Faker::Space.company #=> "SpaceX"
    # ```
    sig { returns(::String) }
    def self.company; end

    # Produces a distance measurement.
    # 
    # ```ruby
    # Faker::Space.distance_measurement #=> "15 parsecs"
    # ```
    sig { returns(::String) }
    def self.distance_measurement; end

    # Produces the name of a meteorite.
    # 
    # ```ruby
    # Faker::Space.meteorite #=> "Ensisheim"
    # ```
    sig { returns(::String) }
    def self.meteorite; end

    # Produces the name of a launch vehicle.
    # 
    # ```ruby
    # Faker::Space.launch_vehicle #=> "Saturn IV"
    # ```
    sig { returns(::String) }
    def self.launch_vehicle; end
  end

  class Types < Faker::Base
    # Produces a random String created from word (Faker::Lorem.word)
    # 
    # ```ruby
    # Faker::Types.rb_string #=> "foobar"
    # ```
    sig { params(legacy_words: T.untyped, words: T.untyped).returns(::String) }
    def self.rb_string(legacy_words = T.unsafe(nil), words: 1); end

    # Produces a random character from the a-z, 0-9 ranges.
    # 
    # ```ruby
    # Faker::Types.character #=> "n"
    # ```
    sig { returns(::String) }
    def self.character; end

    # Produces a random integer.
    # 
    # ```ruby
    # Faker::Types.rb_integer #=> 1
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(Integer)
    end
    def self.rb_integer(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: 0, to: 100); end

    # Produces a random hash with random keys and values.
    # 
    # _@param_ `number` — Specifies the number of key-value pairs.
    # 
    # ```ruby
    # Faker::Types.rb_hash #=> {name: "bob"}
    # Faker::Types.rb_hash(number: 1) #=> {name: "bob"}
    # Faker::Types.rb_hash(number: 2) #=> {name: "bob", last: "marley"}
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        legacy_type: T.untyped,
        number: Integer,
        type: T.untyped
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.rb_hash(legacy_number = T.unsafe(nil), legacy_type = T.unsafe(nil), number: 1, type: random_type); end

    # Produces a random complex hash with random keys and values where the values may include other hashes and arrays.
    # 
    # _@param_ `number` — Specifies the number of key-value pairs.
    # 
    # ```ruby
    # Faker::Types.complex_rb_hash #=> {user: {first: "bob", last: "marley"}}
    # Faker::Types.complex_rb_hash(number: 1) #=> {user: {first: "bob", last: "marley"}}
    # Faker::Types.complex_rb_hash(number: 2) #=> {user: {first: "bob", last: "marley"}, son: ["damien", "marley"]}
    # ```
    sig { params(legacy_number: T.untyped, number: Integer).returns(T::Hash[T.untyped, T.untyped]) }
    def self.complex_rb_hash(legacy_number = T.unsafe(nil), number: 1); end

    # Produces a random array.
    # 
    # _@param_ `len` — Specifies the number of elements in the array.
    # 
    # ```ruby
    # Faker::Types.rb_array #=> ["a"]
    # Faker::Types.rb_array(len: 4) #=> ["a", 1, 2, "bob"]
    # ```
    sig { params(legacy_len: T.untyped, len: Integer).returns(T::Array[T.untyped]) }
    def self.rb_array(legacy_len = T.unsafe(nil), len: 1); end

    # Produces a random type that's either a String or an Integer.
    # 
    # ```ruby
    # Faker::Types.random_type #=> 1 or "a" or "bob"
    # ```
    sig { returns(T.any(String, Integer)) }
    def self.random_type; end

    # Produces a random complex type that's either a String, an Integer, an array or a hash.
    # 
    # ```ruby
    # Faker::Types.random_complex_type #=> 1 or "a" or "bob" or {foo: "bar"}
    # ```
    sig { returns(T.any(String, Integer)) }
    def self.random_complex_type; end

    sig { params(word: T.untyped).returns(T.untyped) }
    def self.titleize(word); end
  end

  class Artist < Faker::Base
    # Produces the name of an artist.
    # 
    # ```ruby
    # Faker::Artist.name #=> "Michelangelo"
    # ```
    sig { returns(::String) }
    def self.name; end
  end

  class Avatar < Faker::Base
    # Produces a URL for an avatar from robohash.org
    # 
    # _@param_ `slug`
    # 
    # _@param_ `size` — image size in pixels, in the format of 'AxB'
    # 
    # _@param_ `format` — The image file format
    # 
    # _@param_ `set` — The avatar set to use
    # 
    # _@param_ `bgset` — The background set to use
    # 
    # _@return_ — A robohash.org URL
    # 
    # ```ruby
    # Faker::Avatar.image
    #   #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug")
    #   #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
    #   #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
    #   #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp")
    #   #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1")
    #   #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
    # ```
    sig do
      params(
        legacy_slug: T.untyped,
        legacy_size: T.untyped,
        legacy_format: T.untyped,
        legacy_set: T.untyped,
        legacy_bgset: T.untyped,
        slug: T.nilable(::String),
        size: ::String,
        format: ::String,
        set: ::String,
        bgset: T.nilable(::String)
      ).returns(::String)
    end
    def self.image(legacy_slug = T.unsafe(nil), legacy_size = T.unsafe(nil), legacy_format = T.unsafe(nil), legacy_set = T.unsafe(nil), legacy_bgset = T.unsafe(nil), slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil); end
  end

  class Camera < Faker::Base
    # Produces a brand of a camera
    # 
    # ```ruby
    # Faker::Camera.brand #=> "Canon"
    # ```
    sig { returns(::String) }
    def self.brand; end

    # Produces a model of camera
    # 
    # ```ruby
    # Faker::Camera.model #=> "450D"
    # ```
    sig { returns(::String) }
    def self.model; end

    # Produces a brand with model
    # 
    # ```ruby
    # Faker::Camera.brand_with_model #=> "Canon 450D"
    # ```
    sig { returns(::String) }
    def self.brand_with_model; end
  end

  class Coffee < Faker::Base
    # Produces a random blend name.
    # 
    # ```ruby
    # Faker::Coffee.blend_name #=> "Major Java"
    # ```
    sig { returns(::String) }
    def self.blend_name; end

    # Produces a random coffee origin place.
    # 
    # ```ruby
    # Faker::Coffee.origin #=> "Oaxaca, Mexico"
    # ```
    sig { returns(::String) }
    def self.origin; end

    # Produces a random coffee variety.
    # 
    # ```ruby
    # Faker::Coffee.variety #=> "Red Bourbon"
    # ```
    sig { returns(::String) }
    def self.variety; end

    # Produces a string containing a random description of a coffee's taste.
    # 
    # ```ruby
    # Faker::Coffee.notes #=> "dull, tea-like, cantaloupe, soy sauce, marshmallow"
    # ```
    sig { returns(::String) }
    def self.notes; end

    # Produces a random coffee taste intensity.
    # 
    # ```ruby
    # Faker::Coffee.intensifier #=> "mild"
    # ```
    sig { returns(::String) }
    def self.intensifier; end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self.search_format(key); end
  end

  class Crypto < Faker::Base
    # Produces an MD5 hash.
    # 
    # ```ruby
    # Faker::Crypto.md5 #=> "6b5ed240042e8a65c55ddb826c3408e6"
    # ```
    sig { returns(::String) }
    def self.md5; end

    # Produces a SHA1 hash.
    # 
    # ```ruby
    # Faker::Crypto.sha1 #=> "4e99e31c51eef8b2d290e709f757f92e558a503f"
    # ```
    sig { returns(::String) }
    def self.sha1; end

    # Produces a SHA256 hash.
    # 
    # ```ruby
    # Faker::Crypto.sha256 #=> "51e4dbb424cd9db1ec5fb989514f2a35652ececef33f21c8dd1fd61bb8e3929d"
    # ```
    sig { returns(::String) }
    def self.sha256; end
  end

  class Device < Faker::Base
    # Produces a build number between 1 and 500.
    # 
    # ```ruby
    # Faker::Device.build_number #=> 5
    # ```
    sig { returns(Integer) }
    def self.build_number; end

    # Produces the name of a manufacturer for a device.
    # 
    # ```ruby
    # Faker::Device.manufacturer #=> "Apple"
    # ```
    sig { returns(::String) }
    def self.manufacturer; end

    # Produces a model name for a device.
    # 
    # ```ruby
    # Faker::Device.model_name #=> "iPhone 4"
    # ```
    sig { returns(::String) }
    def self.model_name; end

    # Produces the name of a platform for a device.
    # 
    # ```ruby
    # Faker::Device.platform #=> "webOS"
    # ```
    sig { returns(::String) }
    def self.platform; end

    # Produces a serial code for a device.
    # 
    # ```ruby
    # Faker::Device.serial #=> "ejfjnRNInxh0363JC2WM"
    # ```
    sig { returns(::String) }
    def self.serial; end

    # Produces a version number between 1 and 1000.
    # 
    # ```ruby
    # Faker::Device.version #=> 42
    # ```
    sig { returns(Integer) }
    def self.version; end
  end

  class Esport < Faker::Base
    # Produces the name of a professional eSports player.
    # 
    # ```ruby
    # Faker::Esport.player #=> "Crimsix"
    # ```
    sig { returns(::String) }
    def self.player; end

    # Produces the name of an eSports team.
    # 
    # ```ruby
    # Faker::Esport.team #=> "CLG"
    # ```
    sig { returns(::String) }
    def self.team; end

    # Produces the name of an eSports league.
    # 
    # ```ruby
    # Faker::Esport.league #=> "IEM"
    # ```
    sig { returns(::String) }
    def self.league; end

    # Produces the name of an eSports event.
    # 
    # ```ruby
    # Faker::Esport.event #=> "ESL Cologne"
    # ```
    sig { returns(::String) }
    def self.event; end

    # Produces the name of a game played as an eSport.
    # 
    # ```ruby
    # Faker::Esport.game #=> "Dota 2"
    # ```
    sig { returns(::String) }
    def self.game; end
  end

  class Gender < Faker::Base
    # Produces the name of a gender identity.
    # 
    # ```ruby
    # Faker::Gender.type #=> "Non-binary"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces either 'Male' or 'Female'.
    # 
    # ```ruby
    # Faker::Gender.binary_type #=> "Female"
    # ```
    sig { returns(::String) }
    def self.binary_type; end

    # Produces either 'f' or 'm'.
    # 
    # ```ruby
    # Faker::Gender.short_binary_type #=> "f"
    # ```
    sig { returns(::String) }
    def self.short_binary_type; end
  end

  # Port of http://shinytoylabs.com/jargon/
  # Are you having trouble writing tech-savvy dialogue for your latest screenplay?
  # Worry not! Hollywood-grade technical talk is ready to fill out any form where you need to look smart.
  class Hacker < Faker::Base
    # Produces something smart.
    # 
    # ```ruby
    # Faker::Hacker.say_something_smart
    #   #=> "Try to compress the SQL interface, maybe it will program the back-end hard drive!"
    # ```
    sig { returns(::String) }
    def self.say_something_smart; end

    # Short technical abbreviations.
    # 
    # ```ruby
    # Faker::Hacker.abbreviation #=> "RAM"
    # ```
    sig { returns(::String) }
    def self.abbreviation; end

    # Hacker-centric adjectives.
    # 
    # ```ruby
    # Faker::Hacker.adjective #=> "open-source"
    # ```
    sig { returns(::String) }
    def self.adjective; end

    # Only the best hacker-related nouns.
    # 
    # ```ruby
    # Faker::Hacker.noun #=> "bandwidth"
    # ```
    sig { returns(::String) }
    def self.noun; end

    # Actions that hackers take.
    # 
    # ```ruby
    # Faker::Hacker.verb #=> "bypass"
    # ```
    sig { returns(::String) }
    def self.verb; end

    # Produces a verb that ends with '-ing'.
    # 
    # ```ruby
    # Faker::Hacker.ingverb #=> "synthesizing"
    # ```
    sig { returns(::String) }
    def self.ingverb; end

    sig { returns(T.untyped) }
    def self.phrases; end
  end

  class Nation < Faker::Base
    # Produces a random nationality.
    # 
    # ```ruby
    # Faker::Nation.nationality #=> "Nepalese"
    # ```
    sig { returns(::String) }
    def self.nationality; end

    # Produces a random national flag emoji.
    # 
    # ```ruby
    # Faker::Nation.flag #=> "🇫🇮"
    # ```
    sig { returns(::String) }
    def self.flag; end

    # Produces a random national language.
    # 
    # ```ruby
    # Faker::Nation.language #=> "Nepali"
    # ```
    sig { returns(::String) }
    def self.language; end

    # Produces a random capital city.
    # 
    # ```ruby
    # Faker::Nation.capital_city #=> "Kathmandu"
    # ```
    sig { returns(::String) }
    def self.capital_city; end

    # Produces a random national sport.
    # 
    # ```ruby
    # Faker::Nation.national_sport #=> "dandi biyo"
    # ```
    sig { returns(::String) }
    def self.national_sport; end
  end

  class Number < Faker::Base
    # Produce a random number.
    # 
    # _@param_ `digits` — Number of digits that the generated number should have.
    # 
    # ```ruby
    # Faker::Number.number(digits: 10) #=> 1968353479
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(Integer) }
    def self.number(legacy_digits = T.unsafe(nil), digits: 10); end

    # Produce a random number with a leading zero.
    # 
    # _@param_ `digits` — Number of digits that the generated number should have.
    # 
    # ```ruby
    # Faker::Number.leading_zero_number(digits: 10) #=> "0669336915"
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(::String) }
    def self.leading_zero_number(legacy_digits = T.unsafe(nil), digits: 10); end

    # Produce a number with a number of digits, preserves leading zeroes.
    # 
    # _@param_ `digits` — Number of digits that the generated number should have.
    # 
    # ```ruby
    # Faker::Number.decimal_part(digits: 2) #=> "09"
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(::String) }
    def self.decimal_part(legacy_digits = T.unsafe(nil), digits: 10); end

    # Produces a float.
    # 
    # _@param_ `l_digits` — Number of digits that the generated decimal should have to the left of the decimal point.
    # 
    # _@param_ `r_digits` — Number of digits that the generated decimal should have to the right of the decimal point.
    # 
    # ```ruby
    # Faker::Number.decimal(l_digits: 2) #=> 11.88
    # Faker::Number.decimal(l_digits: 3, r_digits: 3) #=> 181.843
    # ```
    sig do
      params(
        legacy_l_digits: T.untyped,
        legacy_r_digits: T.untyped,
        l_digits: Integer,
        r_digits: Integer
      ).returns(Float)
    end
    def self.decimal(legacy_l_digits = T.unsafe(nil), legacy_r_digits = T.unsafe(nil), l_digits: 5, r_digits: 2); end

    # Produces a non-zero single-digit integer.
    # 
    # ```ruby
    # Faker::Number.non_zero_digit #=> 8
    # ```
    sig { returns(Integer) }
    def self.non_zero_digit; end

    # Produces a single-digit integer.
    # 
    # ```ruby
    # Faker::Number.digit #=> 1
    # ```
    sig { returns(Integer) }
    def self.digit; end

    # Produces a number in hexadecimal format.
    # 
    # _@param_ `digits` — Number of digits in the he
    # 
    # ```ruby
    # Faker::Number.hexadecimal(digits: 3) #=> "e74"
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(::String) }
    def self.hexadecimal(legacy_digits = T.unsafe(nil), digits: 6); end

    # Produces a float given a mean and standard deviation.
    # 
    # _@param_ `mean`
    # 
    # _@param_ `standard_deviation`
    # 
    # ```ruby
    # Faker::Number.normal(mean: 50, standard_deviation: 3.5) #=> 47.14669604069156
    # ```
    sig do
      params(
        legacy_mean: T.untyped,
        legacy_standard_deviation: T.untyped,
        mean: Integer,
        standard_deviation: T.any(Integer, Float)
      ).returns(Float)
    end
    def self.normal(legacy_mean = T.unsafe(nil), legacy_standard_deviation = T.unsafe(nil), mean: 1, standard_deviation: 1); end

    # Produces a number between two provided values. Boundaries are inclusive.
    # 
    # _@param_ `from` — The lowest number to include.
    # 
    # _@param_ `to` — The highest number to include.
    # 
    # ```ruby
    # Faker::Number.between(from: 1, to: 10) #=> 7
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: Integer,
        to: Integer
      ).returns(Integer)
    end
    def self.between(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: 1.00, to: 5000.00); end

    # Produces a number within two provided values. Boundaries are inclusive or exclusive depending on the range passed.
    # 
    # _@param_ `range` — The range from which to generate a number.
    # 
    # ```ruby
    # Faker::Number.within(range: 1..10) #=> 7
    # ```
    sig { params(legacy_range: T.untyped, range: T::Range[T.untyped]).returns(Integer) }
    def self.within(legacy_range = T.unsafe(nil), range: 1.00..5000.00); end

    # Produces a positive float.
    # 
    # _@param_ `from` — The lower boundary.
    # 
    # _@param_ `to` — The higher boundary.
    # 
    # ```ruby
    # Faker::Number.positive #=> 235.59238499107653
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: Integer,
        to: Integer
      ).returns(Float)
    end
    def self.positive(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: 1.00, to: 5000.00); end

    # Produces a negative float.
    # 
    # _@param_ `from` — The lower boundary.
    # 
    # _@param_ `to` — The higher boundary.
    # 
    # ```ruby
    # Faker::Number.negative #=> -4480.042585669558
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: Integer,
        to: Integer
      ).returns(Float)
    end
    def self.negative(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: -5000.00, to: -1.00); end

    sig { params(count: T.untyped).returns(T.untyped) }
    def self.generate(count); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.greater_than_zero(number); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.less_than_zero(number); end

    sig { params(number: T.untyped, method_to_compare: T.untyped).returns(T.untyped) }
    def self.should_be(number, method_to_compare); end
  end

  class Source < Faker::Base
    # Produces source code for Hello World in a given language.
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.hello_world #=> "puts 'Hello World!'"
    # ```
    # 
    # ```ruby
    # Faker::Source.hello_world(lang: :javascript)
    #   #=> "alert('Hello World!');"
    # ```
    sig { params(legacy_lang: T.untyped, lang: Symbol).returns(::String) }
    def self.hello_world(legacy_lang = T.unsafe(nil), lang: :ruby); end

    # Produces source code for printing a string in a given language.
    # 
    # _@param_ `str` — The string to print
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.print #=> "puts 'faker_string_to_print'"
    # ```
    # 
    # ```ruby
    # Faker::Source.print(str: 'foo bar', lang: :javascript)
    #   #=> "console.log('foo bar');"
    # ```
    sig do
      params(
        legacy_str: T.untyped,
        legacy_lang: T.untyped,
        str: ::String,
        lang: Symbol
      ).returns(::String)
    end
    def self.print(legacy_str = T.unsafe(nil), legacy_lang = T.unsafe(nil), str: 'some string', lang: :ruby); end

    # Produces source code for printing 1 through 10 in a given language.
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.print_1_to_10 #=> "(1..10).each { |i| puts i }"
    # ```
    # 
    # ```ruby
    # Faker::Source.print_1_to_10(lang: :javascript)
    # # => "for (let i=0; i<10; i++) {
    # #       console.log(i);
    # #    }"
    # ```
    sig { params(legacy_lang: T.untyped, lang: Symbol).returns(::String) }
    def self.print_1_to_10(legacy_lang = T.unsafe(nil), lang: :ruby); end
  end

  class Stripe < Faker::Base
    # Produces a random valid card number.
    # 
    # _@param_ `card_type` — Specific valid card type.
    # 
    # ```ruby
    # Faker::Stripe.valid_card #=> "4242424242424242"
    # Faker::Stripe.valid_card(card_type: "visa_debit") #=> "4000056655665556"
    # ```
    sig { params(legacy_card_type: T.untyped, card_type: T.nilable(::String)).returns(::String) }
    def self.valid_card(legacy_card_type = T.unsafe(nil), card_type: nil); end

    # Produces a random valid Stripe token.
    # 
    # _@param_ `card_type` — Specific valid card type.
    # 
    # ```ruby
    # Faker::Stripe.valid_token #=> "tok_visa"
    # Faker::Stripe.valid_token(card_type: "mc_debit") #=> "tok_mastercard_debit"
    # ```
    sig { params(legacy_card_type: T.untyped, card_type: T.nilable(::String)).returns(::String) }
    def self.valid_token(legacy_card_type = T.unsafe(nil), card_type: nil); end

    # Produces a random invalid card number.
    # 
    # ```ruby
    # Faker::Stripe.invalid_card #=> "4000000000000002"
    # Faker::Stripe.invalid_card(card_error: "addressZipFail") #=> "4000000000000010"
    # ```
    sig { params(legacy_card_error: T.untyped, card_error: T.untyped).returns(::String) }
    def self.invalid_card(legacy_card_error = T.unsafe(nil), card_error: nil); end

    # Produces a random month in two digits format.
    # 
    # ```ruby
    # Faker::Stripe.month #=> "10"
    # ```
    sig { returns(::String) }
    def self.month; end

    # Produces a random year that is always in the future.
    # 
    # ```ruby
    # Faker::Stripe.year #=> "2018" # This will always be a year in the future
    # ```
    sig { returns(::String) }
    def self.year; end

    # Produces a random ccv number.
    # 
    # _@param_ `card_type` — Specific valid card type.
    # 
    # ```ruby
    # Faker::Stripe.ccv #=> "123"
    # Faker::Stripe.ccv(card_type: "amex") #=> "1234"
    # ```
    sig { params(legacy_card_type: T.untyped, card_type: T.nilable(::String)).returns(::String) }
    def self.ccv(legacy_card_type = T.unsafe(nil), card_type: nil); end
  end

  class TvShows
    class Buffy < Faker::Base
      # Produces a character from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.character #=> "Buffy Summers"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.quote #=> "If the apocalypse comes, beep me."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a actor from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.actor #=> "John Ritter"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a big bad from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.big_bad #=> "Glory"
      # ```
      sig { returns(::String) }
      def self.big_bad; end

      # Produces an episode from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.episode #=> "Once More, with Feeling"
      # ```
      sig { returns(::String) }
      def self.episode; end
    end

    class Suits < Faker::Base
      # Produces a character from Suits.
      # 
      # ```ruby
      # Faker::TvShows::Suits.character #=> "Harvey Specter"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Suits.
      # 
      # ```ruby
      # Faker::TvShows::Suits.quote #=> "Don't play the odds, play the man."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class DrWho < Faker::Base
      # Produces a character from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.character #=> "Captain Jack Harkness"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces an iteration of The Doctor from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.the_doctor #=> "Ninth Doctor"
      # ```
      sig { returns(::String) }
      def self.the_doctor; end

      # Produces an actor from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.actor #=> "Matt Smith"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a catch phrase from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.catch_phrase #=> "Fantastic!"
      # ```
      sig { returns(::String) }
      def self.catch_phrase; end

      # Produces a quote from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.quote #=> "Lots of planets have a north!"
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a villain from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.villain #=> "The Master"
      # ```
      sig { returns(::String) }
      def self.villain; end

      # Produces a species from Doctor Who.
      # 
      # ```ruby
      # Faker::TvShows::DrWho.specie #=> "Dalek"
      # ```
      sig { returns(::String) }
      def self.specie; end
    end

    class Friends < Faker::Base
      # Produces a character from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.character #=> "Rachel Green"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.location #=> "Central Perk"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.quote #=> "We were on a break!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class RuPaul < Faker::Base
      # Produces a quote from RuPaul's Drag Race.
      # 
      # ```ruby
      # Faker::TvShows::RuPaul.quote #=> "That's Funny, Tell Another One."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a queen from RuPaul's Drag Race.
      # 
      # ```ruby
      # Faker::TvShows::RuPaul.queen #=> "Latrice Royale"
      # ```
      sig { returns(::String) }
      def self.queen; end
    end

    class Futurama < Faker::Base
      # Produces a character from Futurama.
      # 
      # ```ruby
      # Faker::TvShows::Futurama.character #=> "Amy Wong"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Futurama.
      # 
      # ```ruby
      # Faker::TvShows::Futurama.location #=> "Wormulon"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Futurama.
      # 
      # ```ruby
      # Faker::TvShows::Futurama.quote
      #   #=> "Ugh, it's like a party in my mouth & everyone's throwing up."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a catchphrase from Hermes Conrad.
      # 
      # ```ruby
      # Faker::TvShows::Futurama.hermes_catchphrase
      #   #=> "Great foo of bar!"
      # ```
      sig { returns(::String) }
      def self.hermes_catchphrase; end
    end

    class NewGirl < Faker::Base
      # Produces a character from New Girl.
      # 
      # ```ruby
      # Faker::TvShows::NewGirl.character #=> "Jessica Day"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from New Girl.
      # 
      # ```ruby
      # Faker::TvShows::NewGirl.quote
      #   #=> "Are you cooking a frittata in a sauce pan? What is this - prison?"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Seinfeld < Faker::Base
      # Produces a business from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.business #=> "Kruger Industrial Smoothing"
      # ```
      sig { returns(::String) }
      def self.business; end

      # Produces a character from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.character #=> "George Costanza"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.quote
      #   #=> "I'm not a lesbian. I hate men, but I'm not a lesbian."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Simpsons < Faker::Base
      # Produces a character from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.character #=> "Charles Montgomery Burns"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.location #=> "Moe's Tavern"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.quote
      #   #=> "It takes two to lie: one to lie and one to listen."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces an episode title from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.episode_title
      #   #=> "Two Cars in Every Garage and Three Eyes on Every Fish"
      # ```
      sig { returns(::String) }
      def self.episode_title; end
    end

    class Stargate < Faker::Base
      # Produces a character from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.character #=> "Jack O'Neill"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a planet from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.planet #=> "Abydos"
      # ```
      sig { returns(::String) }
      def self.planet; end

      # Produces a quote from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.quote
      #   #=> "General, request permission to beat the crap out of this man."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class Community < Faker::Base
      # Produces a character from Community.
      # 
      # ```ruby
      # Faker::TvShows::Community.characters #=> "Jeff Winger"
      # ```
      sig { returns(::String) }
      def self.characters; end

      # Produces a quote from Community.
      # 
      # ```ruby
      # Faker::TvShows::Community.quotes
      #   #=> "I fear a political career could shine a negative light on my drug dealing."
      # ```
      sig { returns(::String) }
      def self.quotes; end
    end

    class StarTrek < Faker::Base
      # Produces a character from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.character #=> "Spock"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.location #=> "Cardassia"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a species from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.specie #=> "Ferengi"
      # ```
      sig { returns(::String) }
      def self.specie; end

      # Produces a villain from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.villain #=> "Khan Noonien Singh"
      # ```
      sig { returns(::String) }
      def self.villain; end
    end

    class FamilyGuy < Faker::Base
      # Produces a character from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.character #=> "Peter Griffin"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.location #=> "James Woods High"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.quote
      #   #=> "It's Peanut Butter Jelly Time."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class HeyArnold < Faker::Base
      # Produces a character from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.character #=> "Arnold"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.location #=> "Big Bob's Beeper Emporium"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.quote #=> "Stoop Kid's afraid to leave his stoop!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class SouthPark < Faker::Base
      # Produces a character from South Park.
      # 
      # ```ruby
      # Faker::TvShows::SouthPark.character #=> "Mr. Garrison"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from South Park.
      # 
      # ```ruby
      # Faker::TvShows::SouthPark.quote
      #   #=> "I'm just getting a little cancer Stan."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class TwinPeaks < Faker::Base
      # Produces a character from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.character #=> "Dale Cooper"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.location #=> "Black Lodge"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.quote
      #   #=> "The owls are not what they seem."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class FinalSpace < Faker::Base
      # Produces a character from Final Space.
      # 
      # ```ruby
      # Faker::TvShows::FinalSpace.character #=> "Gary Goodspeed"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a vehicle from Final Space.
      # 
      # ```ruby
      # Faker::TvShows::FinalSpace.vehicle #=> "Imperium Cruiser"
      # ```
      sig { returns(::String) }
      def self.vehicle; end

      # Produces a quote from Final Space.
      # 
      # ```ruby
      # Faker::TvShows::FinalSpace.quote
      #   #=> "It's an alien on my face! It's an alien on my...It's a space alien!"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class TheExpanse < Faker::Base
      # Produces a character from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.character #=> "Jim Holden"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.quote #=> "I am that guy."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a location from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.location #=> "Ganymede"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a ship from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.ship #=> "Nauvoo"
      # ```
      sig { returns(::String) }
      def self.ship; end
    end

    class BreakingBad < Faker::Base
      # Produces the name of a character from Breaking Bad.
      # 
      # ```ruby
      # Faker::TvShows::BreakingBad.character #=> "Walter White"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of an episode from Breaking Bad.
      # 
      # ```ruby
      # Faker::TvShows::BreakingBad.episode #=> "Fly"
      # ```
      sig { returns(::String) }
      def self.episode; end
    end

    class TheITCrowd < Faker::Base
      # Produces an actor from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.actor #=> "Chris O'Dowd"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.character #=> "Roy Trenneman"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces an email from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.email #=> "roy.trenneman@reynholm.test"
      # ```
      sig { returns(::String) }
      def self.email; end

      # Produces a quote from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.quote
      #   #=> "Hello, IT. Have you tried turning it off and on again?"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class VentureBros < Faker::Base
      # Produces a character from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.character #=> "Scaramantula"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces an organization from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.organization
      #   #=> "Guild of Calamitous Intent"
      # ```
      sig { returns(::String) }
      def self.organization; end

      # Produces a vehicle from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.vehicle #=> "Monarchmobile"
      # ```
      sig { returns(::String) }
      def self.vehicle; end

      # Produces a quote from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.quote
      #   #=> "Revenge, like gazpacho soup, is best served cold, precise, and merciless."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class MichaelScott < Faker::Base
      # Produces a quote from Michael Scott.
      # 
      # ```ruby
      # Faker::TvShows::MichaelScott.quote
      #   #=> "I am Beyoncé, always."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class ParksAndRec < Faker::Base
      # Produces a character from Parks and Recreation.
      # 
      # ```ruby
      # Faker::TvShows::ParksAndRec.character #=> "Leslie Knope"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a city from Parks and Recreation.
      # 
      # ```ruby
      # Faker::TvShows::ParksAndRec.city #=> "Pawnee"
      # ```
      sig { returns(::String) }
      def self.city; end
    end

    class RickAndMorty < Faker::Base
      # Produces a character from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.character #=> "Rick Sanchez"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.location #=> "Dimension C-132"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.quote
      #   #=> "Ohh yea, you gotta get schwifty."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class SiliconValley < Faker::Base
      # Produces a character from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.character #=> "Jian Yang"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a company from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.company #=> "Bachmanity"
      # ```
      sig { returns(::String) }
      def self.company; end

      # Produces a quote from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.quote
      #   #=> "I don't want to live in a world where someone else is making the world a better place better than we are."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces an app from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.app #=> "Nip Alert"
      # ```
      sig { returns(::String) }
      def self.app; end

      # Produces an invention from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.invention
      #   #=> "Tres Comas Tequila"
      # ```
      sig { returns(::String) }
      def self.invention; end

      # Produces a motto from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.motto
      #   #=> "Our products are products, producing unrivaled results"
      # ```
      sig { returns(::String) }
      def self.motto; end

      # Produces a URL from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.url #=> "http://www.piedpiper.com"
      # ```
      sig { returns(::String) }
      def self.url; end

      # Produces an email address from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.email #=> "richard@piedpiper.test"
      # ```
      sig { returns(::String) }
      def self.email; end
    end

    class BigBangTheory < Faker::Base
      # Produces a character from Big Bang Theory
      # 
      # ```ruby
      # Faker::TvShows::BigBangTheory.character #=> "Sheldon Cooper"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Bing Bang Theory
      # 
      # ```ruby
      # Faker::TvShows::BigBangTheory.quote #=> "I'm not crazy. My mother had me tested."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class BojackHorseman < Faker::Base
      # Produces a character from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.character #=> "BoJack Horseman"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a tongue twister from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.tongue_twister #=> "Did you steal a meal from Neal McBeal the Navy Seal?"
      # ```
      sig { returns(::String) }
      def self.tongue_twister; end

      # Produces a quote from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.quote
      #   #=> "Not understanding that you're a horrible person doesn't make you less of a horrible person."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class DumbAndDumber < Faker::Base
      # Produces an actor from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.actor #=> "Jim Carrey"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a character from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.character #=> "Harry Dunne"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.quote
      #   #=> "Why you going to the airport? Flying somewhere?"
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class GameOfThrones < Faker::Base
      # Produces a character from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.character #=> "Tyrion Lannister"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a house from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.house #=> "Stark"
      # ```
      sig { returns(::String) }
      def self.house; end

      # Produces a city from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.city #=> "Lannisport"
      # ```
      sig { returns(::String) }
      def self.city; end

      # Produces a quote from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.quote
      #   #=> "Never forget who you are. The rest of the world won't. Wear it like an armor and it can never be used against you."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a dragon from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.dragon #=> "Drogon"
      # ```
      sig { returns(::String) }
      def self.dragon; end
    end

    class StrangerThings < Faker::Base
      # Produces a character from Stranger Things.
      # 
      # ```ruby
      # Faker::TvShows::StrangerThings.character #=> "six"
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a quote from Stranger Things.
      # 
      # ```ruby
      # Faker::TvShows::StrangerThings.quote
      #   #=> "Friends don't lie."
      # ```
      sig { returns(::String) }
      def self.character; end
    end

    class TheThickOfIt < Faker::Base
      # Produces a character from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.character #=> "Nicola Murray"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a department from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.department #=> "Shadow Cabinet"
      # ```
      sig { returns(::String) }
      def self.department; end

      # Produces a position from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.position
      #   #=> "Director of Communications"
      # ```
      sig { returns(::String) }
      def self.position; end
    end

    class HowIMetYourMother < Faker::Base
      # Produces a character from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.character #=> "Barney Stinson"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a catch phrase from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.catch_phrase #=> "Legendary"
      # ```
      sig { returns(::String) }
      def self.catch_phrase; end

      # Produces a high five from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.high_five #=> "Relapse Five"
      # ```
      sig { returns(::String) }
      def self.high_five; end

      # Produces a quote from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.quote
      #   #=> "Whenever I'm sad, I stop being sad and be awesome instead."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class AquaTeenHungerForce < Faker::Base
      # Produces a character from Aqua Teen Hunger Force.
      # 
      # ```ruby
      # Faker::TvShows::AquaTeenHungerForce.character #=> "Master Shake"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a perl of great ATHF wisdom
      # 
      # ```ruby
      # Faker::TvShows::AquaTeenHungerForce.quote #=> "Friendship ain't about trust. Friendship's about nunchucks."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end

    class TheFreshPrinceOfBelAir < Faker::Base
      # Produces a character from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.character #=> "Will Smith"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a actor from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.actor #=> "Quincy Jones"
      # ```
      sig { returns(::String) }
      def self.actor; end

      # Produces a quote from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.quote
      #   #=> "Girl, you look so good, I would marry your brother just to get in your family."
      # ```
      sig { returns(::String) }
      def self.quote; end
    end
  end

  class Address < Faker::Base
    # Produces the name of a city.
    # 
    # _@param_ `options`
    # 
    # ```ruby
    # Faker::Address.city #=> "Imogeneborough"
    # Faker::Address.city(options: { with_state: true })
    #   #=> "Northfort, California"
    # ```
    sig { params(legacy_options: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(::String) }
    def self.city(legacy_options = T.unsafe(nil), options: {}); end

    # Produces a street name.
    # 
    # ```ruby
    # Faker::Address.street_name #=> "Larkin Fork"
    # ```
    sig { returns(::String) }
    def self.street_name; end

    # Produces a street address.
    # 
    # _@param_ `include_secondary` — Whether or not to include the secondary address.
    # 
    # ```ruby
    # Faker::Address.street_address #=> "282 Kevin Brook"
    # ```
    sig { params(legacy_include_secondary: T.untyped, include_secondary: T::Boolean).returns(::String) }
    def self.street_address(legacy_include_secondary = T.unsafe(nil), include_secondary: false); end

    # Produces a secondary address.
    # 
    # ```ruby
    # Faker::Address.secondary_address #=> "Apt. 672"
    # ```
    sig { returns(::String) }
    def self.secondary_address; end

    # Produces a building number.
    # 
    # ```ruby
    # Faker::Address.building_number #=> "7304"
    # ```
    sig { returns(::String) }
    def self.building_number; end

    # Produces the name of a community.
    # 
    # ```ruby
    # Faker::Address.community #=> "University Crossing"
    # ```
    sig { returns(::String) }
    def self.community; end

    # Produces a mail box number.
    # 
    # ```ruby
    # Faker::Address.mail_box #=> "PO Box 123"
    # ```
    sig { returns(::String) }
    def self.mail_box; end

    # Produces a Zip Code.
    # 
    # _@param_ `state_abbreviation` — an abbreviation for a state where the zip code should be located.
    # 
    # ```ruby
    # Faker::Address.zip_code #=> "58517"
    # Faker::Address.zip_code #=> "23285-4905"
    # Faker::Address.zip_code(state_abbreviation: 'CO') #=> "80011"
    # ```
    sig { params(legacy_state_abbreviation: T.untyped, state_abbreviation: ::String).returns(::String) }
    def self.zip_code(legacy_state_abbreviation = T.unsafe(nil), state_abbreviation: ''); end

    # Produces the name of a time zone.
    # 
    # ```ruby
    # Faker::Address.time_zone #=> "Asia/Yakutsk"
    # ```
    sig { returns(::String) }
    def self.time_zone; end

    # Produces a street suffix.
    # 
    # ```ruby
    # Faker::Address.street_suffix #=> "Street"
    # ```
    sig { returns(::String) }
    def self.street_suffix; end

    # Produces a city suffix.
    # 
    # ```ruby
    # Faker::Address.city_suffix #=> "fort"
    # ```
    sig { returns(::String) }
    def self.city_suffix; end

    # Produces a city prefix.
    # 
    # ```ruby
    # Faker::Address.city_prefix #=> "Lake"
    # ```
    sig { returns(::String) }
    def self.city_prefix; end

    # Produces a state abbreviation.
    # 
    # ```ruby
    # Faker::Address.state_abbr #=> "AP"
    # ```
    sig { returns(::String) }
    def self.state_abbr; end

    # Produces the name of a state.
    # 
    # ```ruby
    # Faker::Address.state #=> "California"
    # ```
    sig { returns(::String) }
    def self.state; end

    # Produces the name of a country.
    # 
    # ```ruby
    # Faker::Address.country #=> "French Guiana"
    # ```
    sig { returns(::String) }
    def self.country; end

    # Produces a country by ISO country code. See the
    # [List of ISO 3166 country codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
    # on Wikipedia for a full list.
    # 
    # _@param_ `code` — An ISO country code.
    # 
    # ```ruby
    # Faker::Address.country_by_code(code: 'NL') #=> "Netherlands"
    # ```
    sig { params(legacy_code: T.untyped, code: ::String).returns(::String) }
    def self.country_by_code(legacy_code = T.unsafe(nil), code: 'US'); end

    # Produces an ISO 3166 country code when given a country name.
    # 
    # _@param_ `name` — Country name in snake_case format.
    # 
    # ```ruby
    # Faker::Address.country_name_to_code(name: 'united_states') #=> "US"
    # ```
    sig { params(legacy_name: T.untyped, name: ::String).returns(::String) }
    def self.country_name_to_code(legacy_name = T.unsafe(nil), name: 'united_states'); end

    # Produces an ISO 3166 country code.
    # 
    # ```ruby
    # Faker::Address.country_code #=> "IT"
    # ```
    sig { returns(::String) }
    def self.country_code; end

    # Produces a long (alpha-3) ISO 3166 country code.
    # 
    # ```ruby
    # Faker::Address.country_code_long #=> "ITA"
    # ```
    sig { returns(::String) }
    def self.country_code_long; end

    # Produces a latitude.
    # 
    # ```ruby
    # Faker::Address.latitude #=> -58.17256227443719
    # ```
    sig { returns(Float) }
    def self.latitude; end

    # Produces a longitude.
    # 
    # ```ruby
    # Faker::Address.longitude #=> -156.65548382095133
    # ```
    sig { returns(Float) }
    def self.longitude; end

    # Produces a full address.
    # 
    # ```ruby
    # Faker::Address.full_address
    #   #=> "282 Kevin Brook, Imogeneborough, CA 58517"
    # ```
    sig { returns(::String) }
    def self.full_address; end

    # Produces Address hash of required fields
    # 
    #  Faker::Address.full_address_as_hash(:full_address)
    #     #=> {:full_address=>"87635 Rice Street, Lake Brentonton, OR 61896-5968"}
    # 
    #  Faker::Address.full_address_as_hash(:city, :time_zone)
    #     #=> {:city=>"East Faustina", :time_zone=>"America/Mexico_City"}
    # 
    #  Faker::Address.full_address_as_hash(:street_address, street_address: {include_secondary: true})
    #     #=> {:street_address=>"29423 Kenneth Causeway Suite 563"}
    # 
    # ```ruby
    # Faker::Address.full_address_as_hash(:longitude,
    #                                     :latitude,
    #                                     :country_name_to_code,
    #                                     country_name_to_code: {name: 'united_states'})
    #   #=> {:longitude=>-101.74428917174603, :latitude=>-37.40056749089944, :country_name_to_code=>"US"}
    # ```
    sig { params(attrs: T.untyped, attrs_params: T.untyped).returns(T::Hash[T.untyped, T.untyped]) }
    def self.full_address_as_hash(*attrs, **attrs_params); end
  end

  class Ancient < Faker::Base
    # Produces a god from ancient mythology.
    # 
    # ```ruby
    # Faker::Ancient.god #=> "Zeus"
    # ```
    sig { returns(::String) }
    def self.god; end

    # Produces a primordial from ancient mythology.
    # 
    # ```ruby
    # Faker::Ancient.primordial #=> "Gaia"
    # ```
    sig { returns(::String) }
    def self.primordial; end

    # Produces a titan from ancient mythology.
    # 
    # ```ruby
    # Faker::Ancient.titan #=> "Atlas"
    # ```
    sig { returns(::String) }
    def self.titan; end

    # Produces a hero from ancient mythology.
    # 
    # ```ruby
    # Faker::Ancient.hero #=> "Achilles"
    # ```
    sig { returns(::String) }
    def self.hero; end
  end

  class Barcode < Faker::Base
    # Returns a EAN 8 or 13 digit format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.ean      => "85657526"
    #     Faker::Barcode.ean(8)   => "30152700"
    #     Faker::Barcode.ean(13)  => "2115190480285"
    sig { params(length: T.untyped).returns(T.untyped) }
    def self.ean(length = 8); end

    # Returns a EAN 8 or 13 digit format barcode number with composite string attached with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.ean_with_composite_sumbology      => "41007624|JHOC6649"
    #     Faker::Barcode.ean_with_composite_sumbology(8)   => "38357961|XUYJ3266"
    #     Faker::Barcode.ean_with_composite_sumbology(13)  => "9530722443911|CKHWQHID"
    sig { params(length: T.untyped).returns(T.untyped) }
    def self.ean_with_composite_symbology(length = 8); end

    # Returns a UPC_A format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.upc_a      => "766807541831"
    sig { returns(T.untyped) }
    def self.upc_a; end

    # Returns a UPC_E format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.upc_e      => "03746820"
    sig { returns(T.untyped) }
    def self.upc_e; end

    # Returns a UPC_A format barcode number with composite string attached with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.upc_a_with_composite_symbology      => "790670155765|JOVG6208"
    sig { returns(T.untyped) }
    def self.upc_a_with_composite_symbology; end

    # Returns a UPC_E format barcode number with composite string attached with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.upc_e_with_composite_symbology      => "05149247|BKZX9722"
    sig { returns(T.untyped) }
    def self.upc_e_with_composite_symbology; end

    # Returns a ISBN format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.isbn      => "9798363807732"
    sig { returns(T.untyped) }
    def self.isbn; end

    # Returns a ISMN format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.ismn      => "9790527672897"
    sig { returns(T.untyped) }
    def self.ismn; end

    # Returns a ISSN format barcode number with check digit
    #  @return [String]
    # 
    #  @example
    #     Faker::Barcode.issn      => "9775541703338"
    sig { returns(T.untyped) }
    def self.issn; end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self.generate_barcode(key); end

    # Returns the sum of even and odd numbers from value passed
    # 
    # ```ruby
    # Faker::Barcode.send(:sum_even_odd, 12345)   => [9, 5]
    # Faker::Barcode.send(:sum_even_odd, 87465)   => [17, 13]
    # ```
    sig { params(fake_num: T.untyped).returns(T::Array[T.untyped]) }
    def self.sum_even_odd(fake_num); end

    # Generates the check digits from sum passed
    # 
    # ```ruby
    # Faker::Barcode.send(:generate_check_digit, 12, 4)   => 0
    # Faker::Barcode.send(:generate_check_digit, 23, 5)   => 6
    # ```
    sig { params(odd_sum: T.untyped, even_sum: T.untyped).returns(Integer) }
    def self.generate_check_digit(odd_sum, even_sum); end
  end

  class Boolean < Faker::Base
    # Produces a boolean
    # 
    # _@param_ `true_ratio` — The likelihood (as a float, out of 1.0) for the method to return `true`.
    # 
    # ```ruby
    # Faker::Boolean.boolean #=> true
    # ```
    # 
    # ```ruby
    # Faker::Boolean.boolean(true_ratio: 0.2) #=> false
    # ```
    sig { params(legacy_true_ratio: T.untyped, true_ratio: Float).returns(T::Boolean) }
    def self.boolean(legacy_true_ratio = T.unsafe(nil), true_ratio: 0.5); end
  end

  class Company < Faker::Base
    # Produces a company name.
    # 
    # ```ruby
    # Faker::Company.name #=> "Roberts Inc"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a company suffix.
    # 
    # ```ruby
    # Faker::Company.suffix #=> "LLC"
    # ```
    sig { returns(::String) }
    def self.suffix; end

    # Produces a company industry.
    # 
    # ```ruby
    # Faker::Company.industry #=> "Food & Beverages"
    # ```
    sig { returns(::String) }
    def self.industry; end

    # Produces a company catch phrase.
    # 
    # ```ruby
    # Faker::Company.catch_phrase #=> "Grass-roots grid-enabled portal"
    # ```
    sig { returns(::String) }
    def self.catch_phrase; end

    # Produces a company buzzword.
    # 
    # ```ruby
    # Faker::Company.buzzword #=> "flexibility"
    # ```
    sig { returns(::String) }
    def self.buzzword; end

    # Produces some company BS.
    # 
    # When a straight answer won't do, BS to the rescue!
    # 
    # ```ruby
    # Faker::Company.bs #=> "empower customized functionalities"
    # ```
    sig { returns(::String) }
    def self.bs; end

    # Produces a company EIN (Employer Identification Number).
    # 
    # ```ruby
    # Faker::Company.ein #=> "07-4009024"
    # ```
    sig { returns(::String) }
    def self.ein; end

    # Produces a company duns number.
    # 
    # ```ruby
    # Faker::Company.duns_number #=> "70-655-5105"
    # ```
    sig { returns(::String) }
    def self.duns_number; end

    # Produces a company logo.
    # 
    # Get a random company logo url in PNG format.
    # 
    # ```ruby
    # Faker::Company.logo #=> "https://pigment.github.io/fake-logos/logos/medium/color/12.png"
    # ```
    sig { returns(::String) }
    def self.logo; end

    # Produces a company type.
    # 
    # ```ruby
    # Faker::Company.type #=> "Partnership"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces a company profession.
    # 
    # ```ruby
    # Faker::Company.profession #=> "factory worker"
    # ```
    sig { returns(::String) }
    def self.profession; end

    # Produces a company spanish organisation number.
    # 
    # Get a random Spanish organization number. See more here https://es.wikipedia.org/wiki/N%C3%BAmero_de_identificaci%C3%B3n_fiscal
    # 
    # ```ruby
    # Faker::Company.spanish_organisation_number #=> "D6819358"
    # ```
    sig { params(organization_type: T.untyped).returns(::String) }
    def self.spanish_organisation_number(organization_type: nil); end

    # Produces a company swedish organisation number.
    # 
    # Get a random Swedish organization number. See more here https://sv.wikipedia.org/wiki/Organisationsnummer
    # 
    # ```ruby
    # Faker::Company.swedish_organisation_number #=> "3866029808"
    # ```
    sig { returns(::String) }
    def self.swedish_organisation_number; end

    # Produces a company czech organisation number.
    # 
    # ```ruby
    # Faker::Company.czech_organisation_number #=> "90642741"
    # ```
    sig { returns(::String) }
    def self.czech_organisation_number; end

    # Produces a company french siren number.
    # 
    # Get a random French SIREN number. See more here https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_entreprises
    # 
    # ```ruby
    # Faker::Company.french_siren_number #=> "163417827"
    # ```
    sig { returns(::String) }
    def self.french_siren_number; end

    # Produces a company french siret number.
    # 
    # ```ruby
    # Faker::Company.french_siret_number #=> "76430067900496"
    # ```
    sig { returns(::String) }
    def self.french_siret_number; end

    # Produces a company norwegian organisation number.
    # 
    # Get a random Norwegian organization number. Info: https://www.brreg.no/om-oss/samfunnsoppdraget-vart/registera-vare/einingsregisteret/organisasjonsnummeret/
    # 
    # ```ruby
    # Faker::Company.norwegian_organisation_number #=> "842457173"
    # ```
    sig { returns(::String) }
    def self.norwegian_organisation_number; end

    # Produces a company australian business number.
    # 
    # ```ruby
    # Faker::Company.australian_business_number #=> "93579396170"
    # ```
    sig { returns(::String) }
    def self.australian_business_number; end

    # Produces a company polish taxpayer identification_number.
    # 
    # Get a random Polish taxpayer identification number More info https://pl.wikipedia.org/wiki/NIP
    # 
    # ```ruby
    # Faker::Company.polish_taxpayer_identification_number #=> "2767549463"
    # ```
    sig { returns(::String) }
    def self.polish_taxpayer_identification_number; end

    # Produces a company polish register of national economy.
    # 
    # Get a random Polish register of national economy number. More info https://pl.wikipedia.org/wiki/REGON
    # 
    # ```ruby
    # Faker::Company.polish_register_of_national_economy #=> "788435970"
    # ```
    sig { params(legacy_length: T.untyped, length: T.untyped).returns(::String) }
    def self.polish_register_of_national_economy(legacy_length = T.unsafe(nil), length: 9); end

    # Produces a company south african pty ltd registration number.
    # 
    # ```ruby
    # Faker::Company.south_african_pty_ltd_registration_number #=> "7043/2400717902/07"
    # ```
    sig { returns(::String) }
    def self.south_african_pty_ltd_registration_number; end

    # Produces a company south african close corporation registration number.
    # 
    # ```ruby
    # Faker::Company.south_african_close_corporation_registration_number #=> "CK38/5739937418/23"
    # ```
    sig { returns(::String) }
    def self.south_african_close_corporation_registration_number; end

    # Produces a company south african listed company registration number.
    # 
    # ```ruby
    # Faker::Company.south_african_listed_company_registration_number #=> "2512/87676/06"
    # ```
    sig { returns(::String) }
    def self.south_african_listed_company_registration_number; end

    # Produces a company south african trust registration number.
    # 
    # ```ruby
    # Faker::Company.south_african_trust_registration_number #=> "IT5673/937519896"
    # ```
    sig { returns(::String) }
    def self.south_african_trust_registration_number; end

    # Produces a company brazilian company number.
    # 
    # ```ruby
    # Faker::Company.brazilian_company_number #=> "37205322000500"
    # ```
    sig { params(legacy_formatted: T.untyped, formatted: T.untyped).returns(::String) }
    def self.brazilian_company_number(legacy_formatted = T.unsafe(nil), formatted: false); end

    # Get a random Russian tax number.
    sig { params(region: T.untyped, type: T.untyped).returns(T.untyped) }
    def self.russian_tax_number(region: nil, type: :legal); end

    # Produces a company sic code.
    # 
    # ```ruby
    # Faker::Company.sic_code #=> "7383"
    # ```
    sig { returns(::String) }
    def self.sic_code; end

    # Mod11 functionality from https://github.com/badmanski/mod11/blob/master/lib/mod11.rb
    sig { params(number: T.untyped).returns(T.untyped) }
    def self.mod11(number); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.luhn_algorithm(number); end

    sig { params(abn: T.untyped).returns(T.untyped) }
    def self.abn_checksum(abn); end

    sig { params(array: T.untyped).returns(T.untyped) }
    def self.collect_regon_sum(array); end

    sig { params(array: T.untyped, weights: T.untyped).returns(T.untyped) }
    def self.weight_sum(array, weights); end

    # rubocop:disable Style/AsciiComments
    # 
    # For more on Russian tax number algorithm here:
    # https://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика#Вычисление_контрольных_цифр
    # 
    # Range of regions:
    # https://ru.wikipedia.org/wiki/Коды_субъектов_Российской_Федерации
    # 
    # rubocop:enable Style/AsciiComments
    sig { params(region: T.untyped, type: T.untyped).returns(T.untyped) }
    def self.inn_number(region, type); end

    sig { params(factor: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.inn_checksum(factor, number); end

    sig { params(organization_type: T.untyped, code: T.untyped).returns(T.untyped) }
    def self.spanish_cif_control_digit(organization_type, code); end

    sig { params(value: T.untyped).returns(T.untyped) }
    def self.spanish_b_algorithm(value); end
  end

  class Compass < Faker::Base
    # Produces a random cardinal.
    # 
    # ```ruby
    # Faker::Compass.cardinal #=> "north"
    # ```
    sig { returns(::String) }
    def self.cardinal; end

    # Produces a random ordinal.
    # 
    # ```ruby
    # Faker::Compass.ordinal #=> "northwest"
    # ```
    sig { returns(::String) }
    def self.ordinal; end

    # Produces a random half wind.
    # 
    # ```ruby
    # Faker::Compass.half_wind #=> "north-northwest"
    # ```
    sig { returns(::String) }
    def self.half_wind; end

    # Produces a random quarter wind.
    # 
    # ```ruby
    # Faker::Compass.quarter_wind #=> "north by west"
    # ```
    sig { returns(::String) }
    def self.quarter_wind; end

    # Produces a random direction.
    # 
    # ```ruby
    # Faker::Compass.direction #=> "southeast"
    # ```
    sig { returns(::String) }
    def self.direction; end

    # Produces a random abbreviation.
    # 
    # ```ruby
    # Faker::Compass.abbreviation #=> "NEbN"
    # ```
    sig { returns(::String) }
    def self.abbreviation; end

    # Produces a random azimuth.
    # 
    # ```ruby
    # Faker::Compass.azimuth #=> "168.75"
    # ```
    sig { returns(::String) }
    def self.azimuth; end

    # Produces a random cardinal abbreviation.
    # 
    # ```ruby
    # Faker::Compass.cardinal_abbreviation #=> "N"
    # ```
    sig { returns(::String) }
    def self.cardinal_abbreviation; end

    # Produces a random ordinal abbreviation.
    # 
    # ```ruby
    # Faker::Compass.ordinal_abbreviation #=> "SW"
    # ```
    sig { returns(::String) }
    def self.ordinal_abbreviation; end

    # Produces a random half wind abbreviation.
    # 
    # ```ruby
    # Faker::Compass.half_wind_abbreviation #=> "NNE"
    # ```
    sig { returns(::String) }
    def self.half_wind_abbreviation; end

    # Produces a random quarter wind abbreviation.
    # 
    # ```ruby
    # Faker::Compass.quarter_wind_abbreviation #=> "SWbS"
    # ```
    sig { returns(::String) }
    def self.quarter_wind_abbreviation; end

    # Produces a random cardinal azimuth.
    # 
    # ```ruby
    # Faker::Compass.cardinal_azimuth #=> "90"
    # ```
    sig { returns(::String) }
    def self.cardinal_azimuth; end

    # Produces a random ordinal azimuth.
    # 
    # ```ruby
    # Faker::Compass.ordinal_azimuth #=> "135"
    # ```
    sig { returns(::String) }
    def self.ordinal_azimuth; end

    # Produces a random half wind azimuth.
    # 
    # ```ruby
    # Faker::Compass.half_wind_azimuth #=> "292.5"
    # ```
    sig { returns(::String) }
    def self.half_wind_azimuth; end

    # Produces a random quarter wind azimuth
    # 
    # ```ruby
    # Faker::Compass.quarter_wind_azimuth #=> "56.25"
    # ```
    sig { returns(::String) }
    def self.quarter_wind_azimuth; end
  end

  class Cosmere < Faker::Base
    # Produces a random aon.
    # 
    # ```ruby
    # Faker::Cosmere.aon #=> "Rao"
    # ```
    sig { returns(::String) }
    def self.aon; end

    # Produces a random shard world.
    # 
    # ```ruby
    # Faker::Cosmere.shard_world #=> "Yolen"
    # ```
    sig { returns(::String) }
    def self.shard_world; end

    # Produces a random shard.
    # 
    # ```ruby
    # Faker::Cosmere.shard #=> "Ambition"
    # ```
    sig { returns(::String) }
    def self.shard; end

    # Produces a random surge.
    # 
    # ```ruby
    # Faker::Cosmere.surge #=> "Progression"
    # ```
    sig { returns(::String) }
    def self.surge; end

    # Produces a random knight radiant.
    # 
    # ```ruby
    # Faker::Cosmere.knight_radiant #=> "Truthwatcher"
    # ```
    sig { returns(::String) }
    def self.knight_radiant; end

    # Produces a random metal.
    # 
    # ```ruby
    # Faker::Cosmere.metal #=> "Brass"
    # ```
    sig { returns(::String) }
    def self.metal; end

    # Produces a random allomancer.
    # 
    # ```ruby
    # Faker::Cosmere.allomancer #=> "Coinshot"
    # ```
    sig { returns(::String) }
    def self.allomancer; end

    # Produces a random feruchemist.
    # 
    # ```ruby
    # Faker::Cosmere.feruchemist #=> "Archivist"
    # ```
    sig { returns(::String) }
    def self.feruchemist; end

    # Produces a random herald.
    # 
    # ```ruby
    # Faker::Cosmere.herald #=> "Ishar"
    # ```
    sig { returns(::String) }
    def self.herald; end

    # Produces a random spren.
    # 
    # ```ruby
    # Faker::Cosmere.spren #=> "Flamespren"
    # ```
    sig { returns(::String) }
    def self.spren; end
  end

  class Dessert < Faker::Base
    # Produces the name of a dessert variety.
    # 
    # ```ruby
    # Faker::Dessert.variety #=> "Cake"
    # ```
    sig { returns(::String) }
    def self.variety; end

    # Produces the name of a dessert topping.
    # 
    # ```ruby
    # Faker::Dessert.topping #=> "Gummy Bears"
    # ```
    sig { returns(::String) }
    def self.topping; end

    # Produces the name of a dessert flavor.
    # 
    # ```ruby
    # Faker::Dessert.flavor #=> "Salted Caramel"
    # ```
    sig { returns(::String) }
    def self.flavor; end
  end

  class Finance < Faker::Base
    # Produces a random credit card number.
    # 
    # _@param_ `types` — Specific credit card type.
    # 
    # ```ruby
    # Faker::Finance.credit_card #=> "3018-348979-1853"
    # Faker::Finance.credit_card(:mastercard) #=> "6771-8921-2291-6236"
    # Faker::Finance.credit_card(:mastercard, :visa) #=> "4448-8934-1277-7195"
    # ```
    sig { params(types: ::String).returns(::String) }
    def self.credit_card(*types); end

    # Produces a random vat number.
    # 
    # _@param_ `country` — Two capital letter country code to use for the vat number.
    # 
    # ```ruby
    # Faker::Finance.vat_number #=> "BR38.395.329/2471-83"
    # Faker::Finance.vat_number('DE') #=> "DE593306671"
    # Faker::Finance.vat_number('ZA') #=> "ZA79494416181"
    # ```
    sig { params(legacy_country: T.untyped, country: ::String).returns(::String) }
    def self.vat_number(legacy_country = T.unsafe(nil), country: 'BR'); end

    sig { returns(T.untyped) }
    def self.vat_number_keys; end

    # Returns a randomly-selected stock ticker from a specified market.
    # 
    # _@param_ `markets` — The name of the market to choose the ticker from (e.g. NYSE, NASDAQ)
    # 
    # ```ruby
    # Faker::Finance.ticker #=> 'AMZN'
    # Faker::Finance.vat_number('NASDAQ') #=> 'GOOG'
    # ```
    sig { params(markets: ::String).returns(::String) }
    def self.ticker(*markets); end
  end

  class Hipster < Faker::Base
    # Produces a random hipster word.
    # 
    # ```ruby
    # Faker::Hipster.word #=> "irony"
    # ```
    sig { returns(::String) }
    def self.word; end

    # Produces a random hipster word.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `number` — Specifies the number of words returned
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # _@param_ `spaces_allowed` — Specifies if the words may contain spaces
    # 
    # ```ruby
    # Faker::Hipster.words #=> ["pug", "pitchfork", "chia"]
    # Faker::Hipster.words(number: 4) #=> ["ugh", "cardigan", "poutine", "stumptown"]
    # Faker::Hipster.words(number: 4, supplemental: true) #=> ["iste", "seitan", "normcore", "provident"]
    # Faker::Hipster.words(number: 4, supplemental: true, spaces_allowed: true) #=> ["qui", "magni", "craft beer", "est"]
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_spaces_allowed: T.untyped,
        number: Integer,
        supplemental: T::Boolean,
        spaces_allowed: T::Boolean
      ).returns(T::Array[::String])
    end
    def self.words(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_spaces_allowed = T.unsafe(nil), number: 3, supplemental: false, spaces_allowed: false); end

    # Produces a random hipster sentence.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `word_count` — Specifies the number of words in the sentence
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # _@param_ `random_words_to_add` — Specifies the number of random words to add
    # 
    # _@param_ `open_compounds_allowed` — Specifies if the generated sentence can contain words having additional spaces
    # 
    # ```ruby
    # Faker::Hipster.sentence #=> "Park iphone leggings put a bird on it."
    # Faker::Hipster.sentence(word_count: 3) #=> "Pour-over swag godard."
    # Faker::Hipster.sentence(word_count: 3, supplemental: true) #=> "Beard laboriosam sequi celiac."
    # Faker::Hipster.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) #=> "Bitters retro mustache aesthetic biodiesel 8-bit."
    # Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 4) #=> "Occaecati deleniti messenger bag meh crucifix autem."
    # Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: true) #=> "Kale chips nihil eos."
    # Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: false) #=> "Dreamcatcher umami fixie."
    # ```
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: Integer,
        supplemental: T::Boolean,
        random_words_to_add: Integer,
        open_compounds_allowed: T::Boolean
      ).returns(::String)
    end
    def self.sentence(legacy_word_count = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_random_words_to_add = T.unsafe(nil), word_count: 4, supplemental: false, random_words_to_add: 6, open_compounds_allowed: true); end

    # Produces random hipster sentences.
    # 
    # _@param_ `number` — Specifies the number of sentences returned
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # ```ruby
    # Faker::Hipster.sentences #=> ["Godard pitchfork vinegar chillwave everyday 90's whatever.", "Pour-over artisan distillery street waistcoat.", "Salvia yr leggings franzen blue bottle."]
    # Faker::Hipster.sentences(number: 1) #=> ["Before they sold out pinterest venmo umami try-hard ugh hoodie artisan."]
    # Faker::Hipster.sentences(number: 1, supplemental: true) #=> ["Et sustainable optio aesthetic et."]
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: Integer,
        supplemental: T::Boolean
      ).returns(T::Array[::String])
    end
    def self.sentences(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    # Produces a random hipster paragraph.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `sentence_count` — Specifies the number of sentences in the paragraph
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # _@param_ `random_sentences_to_add` — Specifies the number of random sentences to add
    # 
    # ```ruby
    # Faker::Hipster.paragraph #=> "Migas fingerstache pbr&b tofu. Polaroid distillery typewriter echo tofu actually. Slow-carb fanny pack pickled direct trade scenester mlkshk plaid. Banjo venmo chambray cold-pressed typewriter. Fap skateboard intelligentsia."
    # Faker::Hipster.paragraph(sentence_count: 2) #=> "Yolo tilde farm-to-table hashtag. Lomo kitsch disrupt forage +1."
    # Faker::Hipster.paragraph(sentence_count: 2, supplemental: true) #=> "Typewriter iste ut viral kombucha voluptatem. Sint voluptates saepe. Direct trade irony chia excepturi yuccie. Biodiesel esse listicle et quam suscipit."
    # Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) #=> "Selvage vhs chartreuse narwhal vinegar. Authentic vinyl truffaut carry vhs pop-up. Hammock everyday iphone locavore thundercats bitters vegan goth. Fashion axe banh mi shoreditch whatever artisan."
    # Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) #=> "Deep v gluten-free unde waistcoat aperiam migas voluptas dolorum. Aut drinking illo sustainable sapiente. Direct trade fanny pack kale chips ennui semiotics."
    # ```
    sig do
      params(
        legacy_sentence_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_sentences_to_add: T.untyped,
        sentence_count: Integer,
        supplemental: T::Boolean,
        random_sentences_to_add: T::Boolean
      ).returns(::String)
    end
    def self.paragraph(legacy_sentence_count = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), legacy_random_sentences_to_add = T.unsafe(nil), sentence_count: 3, supplemental: false, random_sentences_to_add: 3); end

    # Produces random hipster paragraphs.
    # 
    # _@param_ `number` — Specifies the number of paragraphs
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # ```ruby
    # Faker::Hipster.paragraphs #=> ["Tilde microdosing blog cliche meggings. Intelligentsia five dollar toast forage yuccie. Master kitsch knausgaard. Try-hard everyday trust fund mumblecore.", "Normcore viral pickled. Listicle humblebrag swag tote bag. Taxidermy street hammock neutra butcher cred kale chips. Blog portland humblebrag trust fund irony.", "Single-origin coffee fixie cleanse tofu xoxo. Post-ironic tote bag ramps gluten-free locavore mumblecore hammock. Umami loko twee. Ugh kitsch before they sold out."]
    # Faker::Hipster.paragraphs(number: 1) #=> ["Skateboard cronut synth +1 fashion axe. Pop-up polaroid skateboard asymmetrical. Ennui fingerstache shoreditch before they sold out. Tattooed pitchfork ramps. Photo booth yr messenger bag raw denim bespoke locavore lomo synth."]
    # Faker::Hipster.paragraphs(number: 1, supplemental: true) #=> ["Quae direct trade pbr&b quo taxidermy autem loko. Umami quas ratione migas cardigan sriracha minima. Tenetur perspiciatis pickled sed eum doloribus truffaut. Excepturi dreamcatcher meditation."]
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: Integer,
        supplemental: T::Boolean
      ).returns(T::Array[::String])
    end
    def self.paragraphs(legacy_number = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), number: 3, supplemental: false); end

    # Produces a random hipster paragraph by characters.
    # 
    # _@param_ `characters` — Specifies the number of characters in the paragraph
    # 
    # _@param_ `supplemental` — Specifies if the words are supplemental
    # 
    # ```ruby
    # Faker::Hipster.paragraph_by_chars #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
    # Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false) #=> "Hella kogi blog narwhal sartorial selfies mustache schlitz. Bespoke normcore kitsch cred hella fixie. Park aesthetic fixie migas twee. Cliche mustache brunch tumblr fixie godard. Drinking pop-up synth hoodie dreamcatcher typewriter. Kitsch biodiesel green."
    # ```
    sig do
      params(
        legacy_characters: T.untyped,
        legacy_supplemental: T.untyped,
        characters: Integer,
        supplemental: T::Boolean
      ).returns(::String)
    end
    def self.paragraph_by_chars(legacy_characters = T.unsafe(nil), legacy_supplemental = T.unsafe(nil), characters: 256, supplemental: false); end
  end

  class Invoice < Faker::Base
    # Produces a random amount between values with 2 decimals
    # 
    # _@param_ `from` — Specifies lower limit.
    # 
    # _@param_ `to` — Specifies upper limit.
    # 
    # ```ruby
    # Faker::Finance.amount_between #=> 0
    # Faker::Finance.amount_between(0, 10) #=> 4.33
    # ```
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: Integer,
        to: Integer
      ).returns(Integer)
    end
    def self.amount_between(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: 0, to: 0); end

    # Produces a random valid reference accoring to the International bank slip reference https://en.wikipedia.org/wiki/Creditor_Reference
    # 
    # _@param_ `ref` — Specifies reference base.
    # 
    # ```ruby
    # Faker::Invoice.creditor_reference #=> "RF34118592570724925498"
    # ```
    sig { params(legacy_ref: T.untyped, ref: ::String).returns(::String) }
    def self.creditor_reference(legacy_ref = T.unsafe(nil), ref: ''); end

    # Produces a random valid reference.
    # 
    # _@param_ `ref` — Specifies reference base.
    # 
    # ```ruby
    # Faker::Invoice.reference #=> "45656646957845"
    # ```
    sig { params(legacy_ref: T.untyped, ref: ::String).returns(::String) }
    def self.reference(legacy_ref = T.unsafe(nil), ref: ''); end

    # Calculates the mandatory checksum in 3rd and 4th characters in IBAN format
    # source: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
    sig { params(country_code: T.untyped, account: T.untyped).returns(T.untyped) }
    def self.iban_checksum(country_code, account); end

    # 731 Method
    # Source: https://wiki.xmldation.com/support/fk/finnish_reference_number
    sig { params(base: T.untyped).returns(T.untyped) }
    def self.method_731(base); end

    # Norsk Modulus 10 - KIDMOD10
    sig { params(base: T.untyped).returns(T.untyped) }
    def self.kidmod10(base); end

    # Calculates weigthed sum
    # 
    # For example with 12345678, [1,2]
    # Ref.num. 1 2 3 4 5 6 7 8
    # Multipl. 1 2 1 2 1 2 1 2
    # Total 1+ 4+ 3+ 8+ 5+1+2+ 7+1+6 = 38
    sig { params(base: T.untyped, weight_factors: T.untyped).returns(T.untyped) }
    def self.calculate_weighted_sum(base, weight_factors); end

    # MOD-10 - remainder
    sig { params(number: T.untyped).returns(T.untyped) }
    def self.mod10_remainder(number); end
  end

  class Science < Faker::Base
    # Produces the name of a element.
    # 
    # ```ruby
    # Faker::Science.element #=> "Carbon"
    # ```
    sig { returns(::String) }
    def self.element; end

    # Produces the symbol of an element.
    # 
    # ```ruby
    # Faker::Science.element_symbol #=> "Pb"
    # ```
    sig { returns(::String) }
    def self.element_symbol; end

    # Produces the name of a scientist.
    # 
    # ```ruby
    # Faker::Science.scientist #=> "Isaac Newton"
    # ```
    sig { returns(::String) }
    def self.scientist; end
  end

  class Twitter < Faker::Base
    # Produces a random Twitter user.
    # 
    # _@param_ `include_status` — Include or exclude user status details
    # 
    # _@param_ `include_email` — Include or exclude user email details
    # 
    # ```ruby
    # Faker::Twitter.user #=>  {:id=>8821452687517076614, :name=>"Lincoln Paucek", :screen_name=>"cody"...
    # Faker::Twitter.user(include_status: false) # Just get a user object with no embed status
    # Faker::Twitter.user(include_email: true) # Simulate an authenticated user with the email permission
    # ```
    sig do
      params(
        legacy_include_status: T.untyped,
        legacy_include_email: T.untyped,
        include_status: T::Boolean,
        include_email: T::Boolean
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.user(legacy_include_status = T.unsafe(nil), legacy_include_email = T.unsafe(nil), include_status: true, include_email: false); end

    # Produces a random Twitter user.
    # 
    # _@param_ `include_user` — Include or exclude user details
    # 
    # _@param_ `include_photo` — Include or exclude user photo
    # 
    # ```ruby
    # Faker::Twitter.status #=> {:id=>8821452687517076614, :text=>"Ea et laboriosam vel non."...
    # Faker::Twitter.status(include_user: false) # Just get a status object with no embed user
    # Faker::Twitter.status(include_photo: true) # Includes entities for an attached image
    # ```
    sig do
      params(
        legacy_include_user: T.untyped,
        legacy_include_photo: T.untyped,
        include_user: T::Boolean,
        include_photo: T::Boolean
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.status(legacy_include_user = T.unsafe(nil), legacy_include_photo = T.unsafe(nil), include_user: true, include_photo: false); end

    # Produces a random screen name.
    # 
    # ```ruby
    # Faker::Twitter.screen_name #=> "audreanne_hackett"
    # ```
    sig { returns(::String) }
    def self.screen_name; end

    sig { returns(T.untyped) }
    def self.id; end

    sig { returns(T.untyped) }
    def self.created_at; end

    sig { returns(T.untyped) }
    def self.utc_offset; end

    sig { returns(T.untyped) }
    def self.user_entities; end

    sig { params(legacy_include_photo: T.untyped, include_photo: T.untyped).returns(T.untyped) }
    def self.status_entities(legacy_include_photo = T.unsafe(nil), include_photo: false); end

    sig { returns(T.untyped) }
    def self.photo_entity; end
  end

  class Vehicle < Faker::Base
    # Produces a random vehicle VIN number.
    # 
    # ```ruby
    # Faker::Vehicle.vin #=> "LLDWXZLG77VK2LUUF"
    # ```
    sig { returns(::String) }
    def self.vin; end

    # Produces a random vehicle manufacturer.
    # 
    # ```ruby
    # Faker::Vehicle.manufacture #=> "Lamborghini"
    # ```
    sig { returns(::String) }
    def self.manufacture; end

    # Produces a random vehicle make.
    # 
    # ```ruby
    # Faker::Vehicle.make #=> "Honda"
    # ```
    sig { returns(::String) }
    def self.make; end

    # Produces a random vehicle model.
    # 
    # _@param_ `make_of_model` — Specific valid vehicle make.
    # 
    # ```ruby
    # Faker::Vehicle.model #=> "A8"
    # Faker::Vehicle.model(make_of_model: 'Toyota') #=> "Prius"
    # ```
    sig { params(legacy_make_of_model: T.untyped, make_of_model: ::String).returns(::String) }
    def self.model(legacy_make_of_model = T.unsafe(nil), make_of_model: ''); end

    # Produces a random vehicle make and model.
    # 
    # ```ruby
    # Faker::Vehicle.make_and_model #=> "Dodge Charger"
    # ```
    sig { returns(::String) }
    def self.make_and_model; end

    # Produces a random vehicle style.
    # 
    # ```ruby
    # Faker::Vehicle.style #=> "ESi"
    # ```
    sig { returns(::String) }
    def self.style; end

    # Produces a random vehicle color.
    # 
    # ```ruby
    # Faker::Vehicle.color #=> "Red"
    # ```
    sig { returns(::String) }
    def self.color; end

    # Produces a random vehicle transmission.
    # 
    # ```ruby
    # Faker::Vehicle.transmission #=> "Automanual"
    # ```
    sig { returns(::String) }
    def self.transmission; end

    # Produces a random vehicle drive type.
    # 
    # ```ruby
    # Faker::Vehicle.drive_type #=> "4x2/2-wheel drive"
    # ```
    sig { returns(::String) }
    def self.drive_type; end

    # Produces a random vehicle fuel type.
    # 
    # ```ruby
    # Faker::Vehicle.fuel_type #=> "Diesel"
    # ```
    sig { returns(::String) }
    def self.fuel_type; end

    # Produces a random car type.
    # 
    # ```ruby
    # Faker::Vehicle.car_type #=> "Sedan"
    # ```
    sig { returns(::String) }
    def self.car_type; end

    # Produces a random engine cylinder count.
    # 
    # ```ruby
    # Faker::Vehicle.engine_size #=> 6
    # Faker::Vehicle.engine #=> 4
    # ```
    sig { returns(::String) }
    def self.engine; end

    # Produces a random list of car options.
    # 
    # ```ruby
    # Faker::Vehicle.car_options #=> ["DVD System", "MP3 (Single Disc)", "Tow Package", "CD (Multi Disc)", "Cassette Player", "Bucket Seats", "Cassette Player", "Leather Interior", "AM/FM Stereo", "Third Row Seats"]
    # ```
    sig { returns(T::Array[::String]) }
    def self.car_options; end

    # Produces a random list of standard specs.
    # 
    # ```ruby
    # Faker::Vehicle.standard_specs #=> ["Full-size spare tire w/aluminum alloy wheel", "Back-up camera", "Carpeted cargo area", "Silver accent IP trim finisher -inc: silver shifter finisher", "Back-up camera", "Water-repellent windshield & front door glass", "Floor carpeting"]
    # ```
    sig { returns(T::Array[::String]) }
    def self.standard_specs; end

    # Produces a random vehicle door count.
    # 
    # ```ruby
    # Faker::Vehicle.doors #=> 1
    # Faker::Vehicle.door_count #=> 3
    # ```
    sig { returns(Integer) }
    def self.doors; end

    # Produces a random car year between 1 and 15 years ago.
    # 
    # ```ruby
    # Faker::Vehicle.year #=> 2008
    # ```
    sig { returns(Integer) }
    def self.year; end

    # Produces a random mileage/kilometrage for a vehicle.
    # 
    # _@param_ `min` — Specific minimum limit for mileage generation.
    # 
    # _@param_ `max` — Specific maximum limit for mileage generation.
    # 
    # ```ruby
    # Faker::Vehicle.mileage #=> 26961
    # Faker::Vehicle.mileage(min: 50_000) #=> 81557
    # Faker::Vehicle.mileage(min: 50_000, max: 250_000) #=> 117503
    # Faker::Vehicle.kilometrage #=> 35378
    # ```
    sig do
      params(
        legacy_min: T.untyped,
        legacy_max: T.untyped,
        min: Integer,
        max: Integer
      ).returns(Integer)
    end
    def self.mileage(legacy_min = T.unsafe(nil), legacy_max = T.unsafe(nil), min: T.unsafe(nil), max: T.unsafe(nil)); end

    # Produces a random license plate number.
    # 
    # _@param_ `state_abbreviation` — Two letter state abbreviation for license plate generation.
    # 
    # ```ruby
    # Faker::Vehicle.license_plate #=> "DEP-2483"
    # Faker::Vehicle.license_plate(state_abbreviation: 'FL') #=> "977 UNU"
    # ```
    sig { params(legacy_state_abreviation: T.untyped, state_abbreviation: ::String).returns(::String) }
    def self.license_plate(legacy_state_abreviation = T.unsafe(nil), state_abbreviation: ''); end

    # Produces a random license plate number for Singapore.
    # 
    # ```ruby
    # Faker::Vehicle.singapore_license_plate #=> "SLV1854M"
    # ```
    sig { returns(::String) }
    def self.singapore_license_plate; end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.first_eight(number); end

    sig { params(vin: T.untyped).returns(T.untyped) }
    def self.calculate_vin_check_digit(vin); end

    sig { params(char: T.untyped).returns(T.untyped) }
    def self.vin_char_to_number(char); end

    sig { params(plate_number: T.untyped).returns(T.untyped) }
    def self.singapore_checksum(plate_number); end
  end

  class Fantasy
    class Tolkien < Faker::Base
      # Produces a character from Tolkien's legendarium
      # 
      # ```ruby
      # Faker::Fantasy::Tolkien.character
      #  #=> "Goldberry"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a location from Tolkien's legendarium
      # 
      # ```ruby
      # Faker::Fantasy::Tolkien.location
      #  #=> "Helm's Deep"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a race from Tolkien's legendarium
      # 
      # ```ruby
      # Faker::Fantasy::Tolkien.race
      #   #=> "Uruk-hai"
      # ```
      sig { returns(::String) }
      def self.race; end

      # Produces the name of a poem from Tolkien's legendarium
      # 
      # ```ruby
      # Faker::Fantasy::Tolkien.poem
      #   #=> "Chip the glasses and crack the plates"
      # ```
      sig { returns(::String) }
      def self.poem; end
    end
  end

  class Quotes
    class Chiquito < Faker::Base
      # Produces an Expression from Chiquito
      # 
      # ```ruby
      # Faker::Quotes::Chiquito.expression # => "Ereh un torpedo!"
      # ```
      sig { returns(::String) }
      def self.expression; end

      # Produces a concept from Chiquito
      # 
      # ```ruby
      # Faker::Quotes::Chiquito.term # => "Fistro"
      # ```
      sig { returns(::String) }
      def self.term; end

      # Produces a joke from Chiquito
      # 
      # ```ruby
      # Faker::Quotes::Chiquito.joke # => "- Papar papar llevame al circo!
      #                                    - Noorl! El que quiera verte que venga a la casa"
      # ```
      sig { returns(::String) }
      def self.joke; end

      # Produces a sentence from Chiquito
      # 
      # ```ruby
      # Faker::Quotes::Chiquito.sentence # => "Te llamo trigo por no llamarte Rodrigo"
      # ```
      sig { returns(::String) }
      def self.sentence; end

      sig { returns(T.untyped) }
      def self.expressions; end

      sig { returns(T.untyped) }
      def self.terms; end

      sig { returns(T.untyped) }
      def self.jokes; end

      sig { returns(T.untyped) }
      def self.sentences; end
    end

    class Rajnikanth < Faker::Base
      # Produces a Rajnikanth.
      # Original list of jokes:
      # http://www.rajinikanthjokes.com/
      # 
      # ```ruby
      # Faker::Rajnikanth.joke
      #   #=> "Rajinikanth is so fast that he always comes yesterday."
      # ```
      sig { returns(::String) }
      def self.joke; end
    end

    class Shakespeare < Faker::Base
      # Produces a Shakespeare quote from Hamlet.
      # 
      # ```ruby
      # Faker::Quotes::Shakespeare.hamlet_quote # => "To be, or not to be: that is the question."
      # ```
      sig { returns(::String) }
      def self.hamlet_quote; end

      # Produces a Shakespeare quote from As You Like It.
      # 
      # ```ruby
      # Faker::Quotes::Shakespeare.as_you_like_it_quote # => "Can one desire too much of a good thing?."
      # ```
      sig { returns(::String) }
      def self.as_you_like_it_quote; end

      # Produces a Shakespeare quote from King Richard III.
      # 
      # ```ruby
      # Faker::Quotes::Shakespeare.king_richard_iii_quote # => "Now is the winter of our discontent."
      # ```
      sig { returns(::String) }
      def self.king_richard_iii_quote; end

      # Produces a Shakespeare quote from Romeo And Juliet.
      # 
      # ```ruby
      # Faker::Quotes::Shakespeare.romeo_and_juliet_quote # => "O Romeo, Romeo! wherefore art thou Romeo?."
      # ```
      sig { returns(::String) }
      def self.romeo_and_juliet_quote; end

      sig { returns(T.untyped) }
      def self.hamlet; end

      sig { returns(T.untyped) }
      def self.as_you_like_it; end

      sig { returns(T.untyped) }
      def self.king_richard_iii; end

      sig { returns(T.untyped) }
      def self.romeo_and_juliet; end
    end
  end

  class Sports
    class Football < Faker::Base
      # Produces the name of a football team.
      # 
      # ```ruby
      # Faker::Sports::Football.team #=> "Manchester United"
      # ```
      sig { returns(::String) }
      def self.team; end

      # Produces the name of a football player.
      # 
      # ```ruby
      # Faker::Sports::Football.player #=> "Lionel Messi"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of a football coach.
      # 
      # ```ruby
      # Faker::Sports::Football.coach #=> "Jose Mourinho"
      # ```
      sig { returns(::String) }
      def self.coach; end

      # Produces a football competition.
      # 
      # ```ruby
      # Faker::Sports::Football.competition #=> "FIFA World Cup"
      # ```
      sig { returns(::String) }
      def self.competition; end

      # Produces a position in football.
      # 
      # ```ruby
      # Faker::Sports::Football.position #=> "Defensive Midfielder"
      # ```
      sig { returns(::String) }
      def self.position; end
    end

    class Basketball < Faker::Base
      # Produces the name of a basketball team.
      # 
      # ```ruby
      # Faker::Sports::Basketball.team #=> "Golden State Warriors"
      # ```
      sig { returns(::String) }
      def self.team; end

      # Produces the name of a basketball player.
      # 
      # ```ruby
      # Faker::Sports::Basketball.player #=> "LeBron James"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of a basketball coach.
      # 
      # ```ruby
      # Faker::Sports::Basketball.coach #=> "Gregg Popovich"
      # ```
      sig { returns(::String) }
      def self.coach; end

      # Produces a position in basketball.
      # 
      # ```ruby
      # Faker::Sports::Basketball.position #=> "Point Guard"
      # ```
      sig { returns(::String) }
      def self.position; end
    end

    class Volleyball < Faker::Base
      # Produces the name of a volleyball team.
      # 
      # ```ruby
      # Faker::Sports::Volleyball.team #=> "Leo Shoes Modena"
      # ```
      sig { returns(::String) }
      def self.team; end

      # Produces the name of a volleyball player.
      # 
      # ```ruby
      # Faker::Sports::Volleyball.player #=> "Saeid Marouf"
      # ```
      sig { returns(::String) }
      def self.player; end

      # Produces the name of a volleyball coach.
      # 
      # ```ruby
      # Faker::Sports::Volleyball.coach #=> "Russ Rose"
      # ```
      sig { returns(::String) }
      def self.coach; end

      # Produces a position in volleyball.
      # 
      # ```ruby
      # Faker::Sports::Volleyball.position #=> "Middle blocker"
      # ```
      sig { returns(::String) }
      def self.position; end

      # Produces a formation in volleyball.
      # 
      # ```ruby
      # Faker::Sports::Volleyball.formation #=> "4-2"
      # ```
      sig { returns(::String) }
      def self.formation; end
    end
  end

  class Blockchain
    class Tezos < Faker::Base
      # Produces a random Tezos account address
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.account
      #   #=> "tz1eUsgK6aj752Fbxwk5sAoEFvSDnPjZ4qvk"
      # ```
      sig { returns(::String) }
      def self.account; end

      # Produces a random Tezos contract
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.contract
      #   #=> "KT1MroqeP15nnitB4CnNfkqHYa2NErhPPLWF"
      # ```
      sig { returns(::String) }
      def self.contract; end

      # Produces a random Tezos operation
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.operation
      #   #=> "onygWYXJX3xNstFLv9PcCrhQdCkENC795xwSinmTEc1jsDN4VDa"
      # ```
      sig { returns(::String) }
      def self.operation; end

      # Produces a random Tezos block
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.block
      #   #=> "BMbhs2rkY1dvAkAyRytvPsjFQ2RiPrBhYkxvWpY65dzkdSuw58a"
      # ```
      sig { returns(::String) }
      def self.block; end

      # Produces a random Tezos signature
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.signature
      #   #=> "edsigu165B7VFf3Dpw2QABVzEtCxJY2gsNBNcE3Ti7rRxtDUjqTFRpg67EdAQmY6YWPE5tKJDMnSTJDFu65gic8uLjbW2YwGvAZ"
      # ```
      sig { returns(::String) }
      def self.signature; end

      # Produces a random Tezos public key
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.public_key
      #   #=> "edpkuib9x8QXRc5nWwHUg7U1dXsVmaUrUNU5sX9pVEEvwbMVdfMCeq"
      # ```
      sig { returns(::String) }
      def self.public_key; end

      # Produces a random Tezos public key
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.secret_key
      #   #=> "edsk3HZCAGEGpzQPnQUwQeFY4ESanFhQCgLpKriQw8GHyhKCrjHawv"
      # ```
      sig { returns(::String) }
      def self.secret_key; end

      # _@param_ `prefix`
      # 
      # _@param_ `payload_size` — The size of the payload
      sig { params(prefix: Symbol, payload_size: Integer).returns(::String) }
      def self.encode_tz(prefix, payload_size); end
    end

    class Bitcoin < Faker::Base
      # Produces a Bitcoin wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Bitcoin.address
      #   #=> "147nDP22h3pHrLt2qykTH4txUwQh1ccaXp"
      # ```
      sig { returns(::String) }
      def self.address; end

      # Produces a Bitcoin testnet address
      # 
      # ```ruby
      # Faker::Blockchain::Bitcoin.testnet_address
      #   #=> "n4YjRyYD6V6zREpk6opqESDqD3KYnMdVEB"
      # ```
      sig { returns(::String) }
      def self.testnet_address; end

      # Generates a random Bitcoin address for the given network
      # 
      # _@param_ `network` — The name of network protocol to generate an address for
      # 
      # _@return_ — A Bitcoin address
      sig { params(network: Symbol).returns(::String) }
      def self.address_for(network); end
    end

    class Ethereum < Faker::Base
      # Produces a random Ethereum wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Ethereum.address
      #   #=> "0xd392b0c0500700d02d27ab30805ec80ddd3320ff"
      # ```
      sig { returns(::String) }
      def self.address; end
    end

    class Aeternity < Faker::Base
      # Produces a random Aeternity wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.address
      #   #=> "ak_zvU8YQLagjcfng7Tg8yCdiZ1rpiWNp1PBn3vtUs44utSvbJVR"
      # ```
      sig { returns(::String) }
      def self.address; end

      # Produces a random Aeternity transaction
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.transaction
      #   #=> "th_147nDP22h3pHrLt2qykTH4txUwQh1ccaXp"
      # ```
      sig { returns(::String) }
      def self.transaction; end

      # Produces a random Aeternity contract
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.contract
      #   #=> "ct_Hk2JsNeWGEYQEHHQCfcBeGrwbhtYSwFTPdDhW2SvjFYVojyhW"
      # ```
      sig { returns(::String) }
      def self.contract; end

      # Produces a random Aeternity oracle
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.oracle
      #   #=> "ok_28QDg7fkF5qiKueSdUvUBtCYPJdmMEoS73CztzXCRAwMGKHKZh"
      # ```
      sig { returns(::String) }
      def self.oracle; end

      sig { params(length: T.untyped).returns(T.untyped) }
      def self.rand_strings(length = 50); end
    end
  end

  class Business < Faker::Base
    # Produces a credit card number.
    # 
    # ```ruby
    # Faker::Business.credit_card_number #=> "1228-1221-1221-1431"
    # ```
    sig { returns(::String) }
    def self.credit_card_number; end

    # Produces a credit card expiration date.
    # 
    # ```ruby
    # Faker::Business.credit_card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>
    # ```
    sig { returns(T.untyped) }
    def self.credit_card_expiry_date; end

    # Produces a type of credit card.
    # 
    # ```ruby
    # Faker::Business.credit_card_type #=> "visa"
    # ```
    sig { returns(::String) }
    def self.credit_card_type; end
  end

  class Cannabis < Faker::Base
    # Produces a random strain.
    # 
    # ```ruby
    # Faker::Cannabis.strain #=> "Super Glue"
    # ```
    sig { returns(::String) }
    def self.strain; end

    # Produces a random abbreviation.
    # 
    # ```ruby
    # Faker::Cannabis.cannabinoid_abbreviation #=> "CBGa"
    # ```
    sig { returns(::String) }
    def self.cannabinoid_abbreviation; end

    # Produces a random cannabinoid type.
    # 
    # ```ruby
    # Faker::Cannabis.cannabinoid #=> "Cannabinolic Acid"
    # ```
    sig { returns(::String) }
    def self.cannabinoid; end

    # Produces a random terpene type.
    # 
    # ```ruby
    # Faker::Cannabis.terpene #=> "Terpinene"
    # ```
    sig { returns(::String) }
    def self.terpene; end

    # Produces a random kind of medical use.
    # 
    # ```ruby
    # Faker::Cannabis.medical_use #=> "anti-cancer"
    # ```
    sig { returns(::String) }
    def self.medical_use; end

    # Produces a random health benefit.
    # 
    # ```ruby
    # Faker::Cannabis.health_benefit #=> "prevents infection"
    # ```
    sig { returns(::String) }
    def self.health_benefit; end

    # Produces a random category.
    # 
    # ```ruby
    # Faker::Cannabis.category #=> "crystalline"
    # ```
    sig { returns(::String) }
    def self.category; end

    # Produces a random type.
    # 
    # ```ruby
    # Faker::Cannabis.type #=> "indica"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces a random buzzword.
    # 
    # ```ruby
    # Faker::Cannabis.buzzword #=> "high"
    # ```
    sig { returns(::String) }
    def self.buzzword; end

    # Produces a random brand.
    # 
    # ```ruby
    # Faker::Cannabis.brand #=> "Cannavore Confections"
    # ```
    sig { returns(::String) }
    def self.brand; end
  end

  class Commerce < Faker::Base
    # Produces a random color.
    # 
    # ```ruby
    # Faker::Commerce.color #=> "lavender"
    # ```
    sig { returns(::String) }
    def self.color; end

    # Produces a random promotion code.
    # 
    # _@param_ `digits` — Updates the number of numerical digits used to generate the promotion code.
    # 
    # ```ruby
    # Faker::Commerce.promotion_code #=> "AmazingDeal829102"
    # Faker::Commerce.promotion_code(digits: 2) #=> "AmazingPrice57"
    # ```
    sig { params(legacy_digits: T.untyped, digits: Integer).returns(::String) }
    def self.promotion_code(legacy_digits = T.unsafe(nil), digits: 6); end

    # Produces a random department.
    # 
    # _@param_ `max` — Updates the maximum number of names used to generate the department name.
    # 
    # _@param_ `fixed_amount` — Fixes the amount of departments to use instead of using a range.
    # 
    # ```ruby
    # Faker::Commerce.department #=> "Grocery, Health & Beauty"
    # Faker::Commerce.department(max: 5) #=> "Grocery, Books, Health & Beauty"
    # Faker::Commerce.department(max: 2, fixed_amount: true) #=> "Books & Tools"
    # ```
    sig do
      params(
        legacy_max: T.untyped,
        legacy_fixed_amount: T.untyped,
        max: Integer,
        fixed_amount: T::Boolean
      ).returns(::String)
    end
    def self.department(legacy_max = T.unsafe(nil), legacy_fixed_amount = T.unsafe(nil), max: 3, fixed_amount: false); end

    # Produces a random product name.
    # 
    # ```ruby
    # Faker::Commerce.product_name #=> "Practical Granite Shirt"
    # ```
    sig { returns(::String) }
    def self.product_name; end

    # Produces a random material.
    # 
    # ```ruby
    # Faker::Commerce.material #=> "Plastic"
    # ```
    sig { returns(::String) }
    def self.material; end

    # Produces a random product price.
    # 
    # _@param_ `range` — A range to generate the random number within.
    # 
    # _@param_ `as_string` — Changes the return value to [String].
    # 
    # ```ruby
    # Faker::Commerce.price #=> 44.6
    # Faker::Commerce.price(range: 0..10.0, as_string: true) #=> "2.18"
    # ```
    sig do
      params(
        legacy_range: T.untyped,
        legacy_as_string: T.untyped,
        range: T::Range[T.untyped],
        as_string: T::Boolean
      ).returns(Float)
    end
    def self.price(legacy_range = T.unsafe(nil), legacy_as_string = T.unsafe(nil), range: 0..100.0, as_string: false); end

    sig { params(num: T.untyped).returns(T.untyped) }
    def self.categories(num); end

    sig { params(categories: T.untyped).returns(T.untyped) }
    def self.merge_categories(categories); end
  end

  class Computer < Faker::Base
    # Produces the name of a computer platform.
    # 
    # ```ruby
    # Faker::Computer.platform #=> "Linux"
    # ```
    sig { returns(::String) }
    def self.platform; end

    # Produces the name of a computer type.
    # 
    # ```ruby
    # Faker::Computer.type #=> "server"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces the name of a computer os.
    # 
    # _@param_ `platform` — optionally specify the platform `linux`, `macos`, or `windows`.
    # 
    # ```ruby
    # Faker::Computer.os #=> "RHEL 6.10"
    # ```
    sig { params(platform: ::String).returns(::String) }
    def self.os(platform: self.platform); end

    # Produces a string with computer platform and os
    # 
    # ```ruby
    # Faker::Computer.stack #=> "Linux, RHEL 6.10"
    # ```
    sig { returns(::String) }
    def self.stack; end
  end

  class Currency < Faker::Base
    # Produces the name of a currency.
    # 
    # ```ruby
    # Faker::Currency.name #=> "Swedish Krona"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a currency code.
    # 
    # ```ruby
    # Faker::Currency.code #=> "USD"
    # ```
    sig { returns(::String) }
    def self.code; end

    # Produces a currency symbol.
    # 
    # ```ruby
    # Faker::Currency.symbol #=> "$"
    # ```
    sig { returns(::String) }
    def self.symbol; end
  end

  class Educator < Faker::Base
    # Produces a university name.
    # 
    # ```ruby
    # Faker::Educator.university #=> "Mallowtown Technical College"
    # ```
    sig { returns(::String) }
    def self.university; end

    # Produces a university degree.
    # 
    # ```ruby
    # Faker::Educator.degree #=> "Associate Degree in Criminology"
    # ```
    sig { returns(::String) }
    def self.degree; end

    # Produces a university subject.
    # 
    # ```ruby
    # Faker::Educator.subject #=> "Criminology"
    # ```
    sig { returns(::String) }
    def self.subject; end

    # Produces a course name.
    # 
    # ```ruby
    # Faker::Educator.course_name #=> "Criminology 101"
    # ```
    sig { returns(::String) }
    def self.course_name; end

    # Produces a secondary school.
    # 
    # ```ruby
    # Faker::Educator.secondary_school #=> "Iceborough Secondary College"
    # ```
    sig { returns(::String) }
    def self.secondary_school; end

    # Produces a campus name.
    # 
    # ```ruby
    # Faker::Educator.campus #=> "Vertapple Campus"
    # ```
    sig { returns(::String) }
    def self.campus; end
  end

  class Internet < Faker::Base
    sig do
      params(
        legacy_name: T.untyped,
        legacy_separators: T.untyped,
        name: T.untyped,
        separators: T.untyped,
        domain: T.untyped
      ).returns(T.untyped)
    end
    def self.email(legacy_name = T.unsafe(nil), legacy_separators = T.unsafe(nil), name: nil, separators: nil, domain: nil); end

    sig { params(legacy_name: T.untyped, name: T.untyped).returns(T.untyped) }
    def self.free_email(legacy_name = T.unsafe(nil), name: nil); end

    sig { params(legacy_name: T.untyped, name: T.untyped).returns(T.untyped) }
    def self.safe_email(legacy_name = T.unsafe(nil), name: nil); end

    sig do
      params(
        legacy_specifier: T.untyped,
        legacy_separators: T.untyped,
        specifier: T.untyped,
        separators: T.untyped
      ).returns(T.untyped)
    end
    def self.username(legacy_specifier = T.unsafe(nil), legacy_separators = T.unsafe(nil), specifier: nil, separators: %w[. _]); end

    # Produces a randomized string of characters suitable for passwords
    # 
    # _@param_ `min_length` — The minimum length of the password
    # 
    # _@param_ `max_length` — The maximum length of the password
    # 
    # _@param_ `mix_case` — Toggles if uppercased letters are allowed. If true, at least one will be added.
    # 
    # _@param_ `special_characters` — Toggles if special characters are allowed. If true, at least one will be added.
    # 
    # ```ruby
    # Faker::Internet.password #=> "Vg5mSvY1UeRg7"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 8) #=> "YfGjIk0hGzDqS0"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20) #=> "EoC9ShWd1hWq4vBgFw"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) #=> "3k5qS15aNmG"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) #=> "*%NkOnJsH4"
    # ```
    sig do
      params(
        legacy_min_length: T.untyped,
        legacy_max_length: T.untyped,
        legacy_mix_case: T.untyped,
        legacy_special_characters: T.untyped,
        min_length: Integer,
        max_length: Integer,
        mix_case: T::Boolean,
        special_characters: T::Boolean
      ).returns(::String)
    end
    def self.password(legacy_min_length = T.unsafe(nil), legacy_max_length = T.unsafe(nil), legacy_mix_case = T.unsafe(nil), legacy_special_characters = T.unsafe(nil), min_length: 8, max_length: 16, mix_case: true, special_characters: false); end

    sig { params(legacy_subdomain: T.untyped, subdomain: T.untyped, domain: T.untyped).returns(T.untyped) }
    def self.domain_name(legacy_subdomain = T.unsafe(nil), subdomain: false, domain: nil); end

    sig { params(legacy_string: T.untyped, string: T.untyped).returns(T.untyped) }
    def self.fix_umlauts(legacy_string = T.unsafe(nil), string: ''); end

    sig { returns(T.untyped) }
    def self.domain_word; end

    sig { returns(T.untyped) }
    def self.domain_suffix; end

    sig { params(legacy_prefix: T.untyped, prefix: T.untyped).returns(T.untyped) }
    def self.mac_address(legacy_prefix = T.unsafe(nil), prefix: ''); end

    sig { returns(T.untyped) }
    def self.ip_v4_address; end

    sig { returns(T.untyped) }
    def self.private_ip_v4_address; end

    sig { returns(T.untyped) }
    def self.public_ip_v4_address; end

    sig { returns(T.untyped) }
    def self.private_nets_regex; end

    sig { returns(T.untyped) }
    def self.private_net_checker; end

    sig { returns(T.untyped) }
    def self.reserved_nets_regex; end

    sig { returns(T.untyped) }
    def self.reserved_net_checker; end

    sig { returns(T.untyped) }
    def self.ip_v4_cidr; end

    sig { returns(T.untyped) }
    def self.ip_v6_address; end

    sig { returns(T.untyped) }
    def self.ip_v6_cidr; end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_host: T.untyped,
        legacy_path: T.untyped,
        legacy_scheme: T.untyped,
        host: T.untyped,
        path: T.untyped,
        scheme: T.untyped
      ).returns(T.untyped)
    end
    def self.url(legacy_host = T.unsafe(nil), legacy_path = T.unsafe(nil), legacy_scheme = T.unsafe(nil), host: domain_name, path: "/#{username}", scheme: 'http'); end

    sig do
      params(
        legacy_words: T.untyped,
        legacy_glue: T.untyped,
        words: T.untyped,
        glue: T.untyped
      ).returns(T.untyped)
    end
    def self.slug(legacy_words = T.unsafe(nil), legacy_glue = T.unsafe(nil), words: nil, glue: nil); end

    sig { returns(T.untyped) }
    def self.device_token; end

    sig { params(legacy_vendor: T.untyped, vendor: T.untyped).returns(T.untyped) }
    def self.user_agent(legacy_vendor = T.unsafe(nil), vendor: nil); end

    sig { returns(T.untyped) }
    def self.uuid; end

    # Produces a random string of alphabetic characters, (no digits)
    # 
    # _@param_ `length` — The length of the string to generate
    # 
    # _@param_ `padding` — Toggles if a final equal '=' will be added.
    # 
    # _@param_ `urlsafe` — Toggles charset to '-' and '_' instead of '+' and '/'.
    # 
    # ```ruby
    # Faker::Internet.base64
    #   #=> "r_hbZ2DSD-ZACzZT"
    # ```
    # 
    # ```ruby
    # Faker::Internet.base64(length: 4, padding: true, urlsafe: false)
    #   #=> "x1/R="
    # ```
    sig { params(length: Integer, padding: T::Boolean, urlsafe: T::Boolean).returns(::String) }
    def self.base64(length: 16, padding: false, urlsafe: true); end

    sig { params(local_part: T.untyped).returns(T.untyped) }
    def self.sanitize_email_local_part(local_part); end

    sig { params(local_part: T.untyped, domain_name: T.untyped).returns(T.untyped) }
    def self.construct_email(local_part, domain_name); end

    class HTTP < Faker::Base
      # Produces an HTTP status code
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code #=> 418
      # ```
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code(group: :information) #=> 102
      # ```
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code(group: :successful) #=> 200
      # ```
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code(group: :redirect) #=> 306
      # ```
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code(group: :client_error) #=> 451
      # ```
      # 
      # ```ruby
      # Faker::Internet::HTTP.status_code(group: :server_error) #=> 502
      # ```
      sig { params(group: T.untyped).returns(Integer) }
      def self.status_code(group: nil); end
    end
  end

  class Markdown < Faker::Base
    # Produces a random header format.
    # 
    # ```ruby
    # Faker::Markdown.headers #=> "##### Autem"
    # ```
    sig { returns(::String) }
    def self.headers; end

    # Produces a random emphasis formatting on a random word in two sentences.
    # 
    # ```ruby
    # Faker::Markdown.emphasis #=> "_Incidunt atque quis repellat id impedit.  Quas numquam quod incidunt dicta non. Blanditiis delectus laudantium atque reiciendis qui._"
    # ```
    sig { returns(::String) }
    def self.emphasis; end

    # Produces a random ordered list of items between 1 and 10 randomly.
    # 
    # ```ruby
    # Faker::Markdown.ordered_list #=> "1. Qui reiciendis non consequatur atque.\n2. Quo doloremque veritatis tempora aut.\n3. Aspernatur.\n4. Ea ab.\n5. Qui.\n6. Sit pariatur nemo eveniet.\n7. Molestiae aut.\n8. Nihil molestias iure placeat.\n9. Dolore autem quisquam."
    # ```
    sig { returns(::String) }
    def self.ordered_list; end

    # Produces a random unordered list of items between 1 and 10 randomly.
    # 
    # ```ruby
    # Faker::Markdown.unordered_list #=> "* Voluptatum aliquid tempora molestiae facilis non sed.\n* Nostrum omnis iste impedit voluptatum dolor.\n* Esse quidem et facere."
    # ```
    sig { returns(::String) }
    def self.unordered_list; end

    # Produces a random inline code snippet between two sentences.
    # 
    # ```ruby
    # Faker::Markdown.inline_code #=> "Aut eos quis suscipit. `Dignissimos voluptatem expedita qui.` Quo doloremque veritatis tempora aut."
    # ```
    sig { returns(::String) }
    def self.inline_code; end

    # Produces a random code block formatted in Ruby.
    # 
    # ```ruby
    # Faker::Markdown.block_code #=> "```ruby\nEos quasi qui.\n```"
    # ```
    sig { returns(::String) }
    def self.block_code; end

    # Produces a random 3x4 table with a row of headings, a row of hyphens and two rows of data
    # 
    # ```ruby
    # Faker::Markdown.table #=> "ad | similique | voluptatem\n---- | ---- | ----\ncorrupti | est | rerum\nmolestiae | quidem | et"
    # ```
    sig { returns(::String) }
    def self.table; end

    # Produces a random method from the methods above, excluding the methods listed in the arguments.
    # 
    # ```ruby
    # Faker::Markdown.random #=> returns output from a single method outlined above
    # Faker::Markdown.random("table") #=> returns output from any single method outlined above except for "table"
    # Faker::Markdown.random("ordered_list", "unordered_list") #=> returns output from any single method outlined above except for either ordered_list and unordered_list
    # ```
    sig { params(args: T.untyped).returns(T.any(String, T::Array[::String])) }
    def self.random(*args); end

    # Produces a simulated blog-esque text-heavy block in markdown
    # 
    # Keyword arguments: sentences, repeat
    # 
    # _@param_ `sentences` — Specifies how many sentences make a text block.
    # 
    # _@param_ `repeat` — Specifies how many times the text block repeats.
    # 
    # ```ruby
    # Faker::Markdown.sandwich #=> returns newline separated content of 1 header, 1 default lorem paragraph, and 1 random markdown element
    # Faker::Markdown.sandwich(sentences: 5) #=> returns newline separated content of 1 header, 1 5-sentence lorem paragraph, and 1 random markdown element
    # Faker::Markdown.sandwich(sentences: 6, repeat: 3) #=> returns newline separated content of 1 header, and then 3 sections consisting of, here, 1 6-sentence lorem paragraph and 1 random markdown element. The random markdown element is chosen at random in each iteration of the paragraph-markdown pairing.
    # ```
    sig do
      params(
        legacy_sentences: T.untyped,
        legacy_repeat: T.untyped,
        sentences: Integer,
        repeat: Integer
      ).returns(::String)
    end
    def self.sandwich(legacy_sentences = T.unsafe(nil), legacy_repeat = T.unsafe(nil), sentences: 3, repeat: 1); end

    sig { returns(T.untyped) }
    def self.available_methods; end
  end

  class Military < Faker::Base
    # Produces a rank in the U.S. Army.
    # 
    # ```ruby
    # Faker::Military.army_rank #=> "Staff Sergeant"
    # ```
    sig { returns(::String) }
    def self.army_rank; end

    # Produces a rank in the U.S. Marines.
    # 
    # ```ruby
    # Faker::Military.marines_rank #=> "Gunnery Sergeant"
    # ```
    sig { returns(::String) }
    def self.marines_rank; end

    # Produces a rank in the U.S. Navy.
    # 
    # ```ruby
    # Faker::Military.navy_rank #=> "Seaman"
    # ```
    sig { returns(::String) }
    def self.navy_rank; end

    # Produces a rank in the U.S. Air Force.
    # 
    # ```ruby
    # Faker::Military.air_force_rank #=> "Captain"
    # ```
    sig { returns(::String) }
    def self.air_force_rank; end

    # Produces a rank in the U.S. Space Force.
    # 
    # ```ruby
    # Faker::Military.space_force_rank #=> "Senior Enlisted Advisor of the Space Force"
    # ```
    sig { returns(::String) }
    def self.space_force_rank; end

    # Produces a rank in the U.S. Coast Guard
    # 
    # ```ruby
    # Faker::Military.coast_guard_rank #=> "Master Chief Petty Officer of the Coast Guard"
    # ```
    sig { returns(::String) }
    def self.coast_guard_rank; end

    # Produces a U.S. Department of Defense Paygrade.
    # 
    # ```ruby
    # Faker::Military.dod_paygrade #=> "E-6"
    # ```
    sig { returns(::String) }
    def self.dod_paygrade; end
  end

  class Mountain < Faker::Base
    # Produces a name of a mountain
    # 
    #  @faker.version next
    # 
    # ```ruby
    # Faker::Mountain.name #=> "Mount Everest"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a name of a range
    # 
    # ```ruby
    # Faker::Mountain.range #=> "Dhaulagiri Himalaya"
    # ```
    sig { returns(::String) }
    def self.range; end
  end

  class Omniauth < Faker::Base
    sig { params(name: T.untyped, email: T.untyped).void }
    def initialize(name: nil, email: nil); end

    # Generate a mock Omniauth response from Google.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `email` — A specific email to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-google.
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.nilable(::String),
        email: T.nilable(::String),
        uid: ::String
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.google(legacy_name = T.unsafe(nil), legacy_email = T.unsafe(nil), legacy_uid = T.unsafe(nil), name: nil, email: nil, uid: Number.number(digits: 9).to_s); end

    # Generate a mock Omniauth response from Facebook.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `email` — A specific email to return in the response.
    # 
    # _@param_ `username` — A specific username to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-facebook.
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_username: T.untyped,
        legacy_uid: T.untyped,
        name: T.nilable(::String),
        email: T.nilable(::String),
        username: T.nilable(::String),
        uid: ::String
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.facebook(legacy_name = T.unsafe(nil), legacy_email = T.unsafe(nil), legacy_username = T.unsafe(nil), legacy_uid = T.unsafe(nil), name: nil, email: nil, username: nil, uid: Number.number(digits: 7).to_s); end

    # Generate a mock Omniauth response from Twitter.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `nickname` — A specific nickname to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-twitter.
    sig do
      params(
        legacy_name: T.untyped,
        legacy_nickname: T.untyped,
        legacy_uid: T.untyped,
        name: T.nilable(::String),
        nickname: T.nilable(::String),
        uid: ::String
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.twitter(legacy_name = T.unsafe(nil), legacy_nickname = T.unsafe(nil), legacy_uid = T.unsafe(nil), name: nil, nickname: nil, uid: Number.number(digits: 6).to_s); end

    # Generate a mock Omniauth response from LinkedIn.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `email` — A specific email to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-linkedin.
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.nilable(::String),
        email: T.nilable(::String),
        uid: ::String
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.linkedin(legacy_name = T.unsafe(nil), legacy_email = T.unsafe(nil), legacy_uid = T.unsafe(nil), name: nil, email: nil, uid: Number.number(digits: 6).to_s); end

    # Generate a mock Omniauth response from Github.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `email` — A specific email to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-github.
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.nilable(::String),
        email: T.nilable(::String),
        uid: ::String
      ).returns(T::Hash[T.untyped, T.untyped])
    end
    def self.github(legacy_name = T.unsafe(nil), legacy_email = T.unsafe(nil), legacy_uid = T.unsafe(nil), name: nil, email: nil, uid: Number.number(digits: 8).to_s); end

    # Generate a mock Omniauth response from Apple.
    # 
    # _@param_ `name` — A specific name to return in the response.
    # 
    # _@param_ `email` — A specific email to return in the response.
    # 
    # _@param_ `uid` — A specific UID to return in the response.
    # 
    # _@return_ — An auth hash in the format provided by omniauth-apple.
    sig { params(name: T.nilable(::String), email: T.nilable(::String), uid: T.nilable(::String)).returns(T::Hash[T.untyped, T.untyped]) }
    def self.apple(name: nil, email: nil, uid: nil); end

    sig { returns(T.untyped) }
    def self.gender; end

    sig { returns(T.untyped) }
    def self.timezone; end

    sig { returns(T.untyped) }
    def self.image; end

    sig { returns(T.untyped) }
    def self.city_state; end

    sig { params(range: T.untyped).returns(T.untyped) }
    def self.random_number_from_range(range); end

    sig { returns(T.untyped) }
    def self.random_boolean; end

    # Returns the value of attribute name.
    sig { returns(T.untyped) }
    attr_reader :name

    # Returns the value of attribute first_name.
    sig { returns(T.untyped) }
    attr_reader :first_name

    # Returns the value of attribute last_name.
    sig { returns(T.untyped) }
    attr_reader :last_name

    # Returns the value of attribute email.
    sig { returns(T.untyped) }
    attr_reader :email
  end

  class Appliance < Faker::Base
    # Produces the name of an appliance brand.
    # 
    # ```ruby
    # Faker::Appliance.brand #=> "Bosch"
    # ```
    sig { returns(::String) }
    def self.brand; end

    # Produces the name of a type of appliance equipment.
    # 
    # ```ruby
    # Faker::Appliance.equipment #=> "Appliance plug"
    # ```
    sig { returns(::String) }
    def self.equipment; end
  end

  class ChileRut < Faker::Base
    class << self
      # Returns the value of attribute last_rut.
      sig { returns(T.untyped) }
      attr_reader :last_rut
    end

    # Produces a random Chilean RUT (Rol Unico Tributario, ID with 8 digits).
    # 
    # _@param_ `min_rut` — Specifies the minimum value of the rut.
    # 
    # _@param_ `fixed` — Determines if the rut is fixed (returns the min_rut value).
    # 
    # ```ruby
    # Faker::ChileRut.rut #=> 11235813
    # Faker::ChileRut.rut(min_rut: 20890156) #=> 31853211
    # Faker::ChileRut.rut(min_rut: 20890156, fixed: true) #=> 20890156
    # ```
    sig do
      params(
        legacy_min_rut: T.untyped,
        legacy_fixed: T.untyped,
        min_rut: Integer,
        fixed: T::Boolean
      ).returns(Number)
    end
    def self.rut(legacy_min_rut = T.unsafe(nil), legacy_fixed = T.unsafe(nil), min_rut: 1, fixed: false); end

    # Produces a random Chilean digito verificador (check-digit).
    # 
    # ```ruby
    # Faker::ChileRut.dv #=> "k"
    # ```
    sig { returns(::String) }
    def self.dv; end

    # Produces a random Chilean digito verificador (check-digit).
    # Alias for english speaking devs.
    # 
    # ```ruby
    # Faker::ChileRut.check_digit #=> "5"
    # ```
    sig { returns(::String) }
    def self.check_digit; end

    # Produces a random Chilean RUT (Rol Unico Tributario, ID with 8 digits) with a dv (digito verificador, check-digit).
    # 
    # _@param_ `min_rut` — Specifies the minimum value of the rut.
    # 
    # _@param_ `fixed` — Determines if the rut is fixed (returns the min_rut value).
    # 
    # ```ruby
    # Faker::ChileRut.full_rut #=> "30686957-4"
    # Faker::ChileRut.full_rut(min_rut: 20890156) #=> "30686957-4"
    # Faker::ChileRut.full_rut(min_rut: 30686957, fixed: true) #=> "30686957-4"
    # ```
    sig do
      params(
        legacy_min_rut: T.untyped,
        legacy_fixed: T.untyped,
        min_rut: Integer,
        fixed: T::Boolean
      ).returns(::String)
    end
    def self.full_rut(legacy_min_rut = T.unsafe(nil), legacy_fixed = T.unsafe(nil), min_rut: 0, fixed: false); end
  end

  class DcComics < Faker::Base
    # Produces a hero name from DC Comics
    # 
    # ```ruby
    # Faker::DcComics.hero #=> "Batman"
    # ```
    sig { returns(::String) }
    def self.hero; end

    # Produces a heroine name from DC Comics
    # 
    # ```ruby
    # Faker::DcComics.heroine #=> "Supergirl"
    # ```
    sig { returns(::String) }
    def self.heroine; end

    # Produces a villain name from DC Comics
    # 
    # ```ruby
    # Faker::DcComics.villain #=> "The Joker"
    # ```
    sig { returns(::String) }
    def self.villain; end

    # Produces a character name from DC Comics
    # 
    # ```ruby
    # Faker::DcComics.name #=> "Clark Kent"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a comic book title from DC Comics
    # 
    # ```ruby
    # Faker::DcComics.title #=> "Batman: The Long Halloween"
    # ```
    sig { returns(::String) }
    def self.title; end
  end

  class IDNumber < Faker::Base
    # Produces a random valid US Social Security number.
    # 
    # ```ruby
    # Faker::IDNumber.valid #=> "552-56-3593"
    # ```
    sig { returns(::String) }
    def self.valid; end

    # Produces a random invalid US Social Security number.
    # 
    # ```ruby
    # Faker::IDNumber.invalid #=> "311-72-0000"
    # ```
    sig { returns(::String) }
    def self.invalid; end

    sig { returns(T.untyped) }
    def self.ssn_valid; end

    # Produces a random Spanish citizen identifier (DNI).
    # 
    # ```ruby
    # Faker::IDNumber.spanish_citizen_number #=> "53290236-H"
    # ```
    sig { returns(::String) }
    def self.spanish_citizen_number; end

    # Produces a random Spanish foreign born citizen identifier (NIE).
    # 
    # ```ruby
    # Faker::IDNumber.spanish_foreign_citizen_number #=> "Z-1600870-Y"
    # ```
    sig { returns(::String) }
    def self.spanish_foreign_citizen_number; end

    # Produces a random valid South African ID Number.
    # 
    # ```ruby
    # Faker::IDNumber.south_african_id_number #=> "8105128870184"
    # Faker::IDNumber.valid_south_african_id_number #=> "8105128870184"
    # ```
    sig { returns(::String) }
    def self.valid_south_african_id_number; end

    # Produces a random invalid South African ID Number.
    # 
    # ```ruby
    # Faker::IDNumber.invalid_south_african_id_number #=> "1642972065088"
    # ```
    sig { returns(::String) }
    def self.invalid_south_african_id_number; end

    # Produces a random Brazilian Citizen Number (CPF).
    # 
    # _@param_ `formatted` — Specifies if the number is formatted with dividers.
    # 
    # ```ruby
    # Faker::IDNumber.brazilian_citizen_number #=> "53540542221"
    # Faker::IDNumber.brazilian_citizen_number(formatted: true) #=> "535.405.422-21"
    # ```
    sig { params(legacy_formatted: T.untyped, formatted: T::Boolean).returns(::String) }
    def self.brazilian_citizen_number(legacy_formatted = T.unsafe(nil), formatted: false); end

    # Produces a random Brazilian ID Number (RG).
    # 
    # _@param_ `formatted` — Specifies if the number is formatted with dividers.
    # 
    # ```ruby
    # Faker::IDNumber.brazilian_id #=> "493054029"
    # Faker::IDNumber.brazilian_id(formatted: true) #=> "49.305.402-9"
    # ```
    sig { params(legacy_formatted: T.untyped, formatted: T::Boolean).returns(::String) }
    def self.brazilian_id(legacy_formatted = T.unsafe(nil), formatted: false); end

    # Produces a random Chilean ID (Rut with 8 digits).
    # 
    # ```ruby
    # Faker::IDNumber.chilean_id #=> "15620613-K"
    # ```
    sig { returns(::String) }
    def self.chilean_id; end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.chilean_verification_code(digits); end

    sig { params(id_number: T.untyped).returns(T.untyped) }
    def self.south_african_id_checksum_digit(id_number); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_citizen_number_checksum_digit(digits); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_id_checksum_digit(digits); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_document_checksum(digits); end

    sig { params(checksum: T.untyped, id: T.untyped).returns(T.untyped) }
    def self.brazilian_document_digit(checksum, id: false); end

    sig { params(remainder: T.untyped).returns(T.untyped) }
    def self.brazilian_citizen_number_digit(remainder); end

    sig { params(remainder: T.untyped).returns(T.untyped) }
    def self.brazilian_id_digit(remainder); end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self._translate(key); end
  end

  class Marketing < Faker::Base
    # Produces the name of a video game console or platform.
    # 
    # ```ruby
    # Faker::Marketing.buzzwords #=> "rubber meets the road"
    # ```
    sig { returns(::String) }
    def self.buzzwords; end
  end

  class Superhero < Faker::Base
    # Produces a superpower.
    # 
    # ```ruby
    # Faker::Superhero.power #=> "Photokinesis"
    # ```
    sig { returns(::String) }
    def self.power; end

    # Produces a superhero name prefix.
    # 
    # ```ruby
    # Faker::Superhero.prefix #=> "the Fated"
    # ```
    sig { returns(::String) }
    def self.prefix; end

    # Produces a superhero name suffix.
    # 
    # ```ruby
    # Faker::Superhero.suffix #=> "Captain"
    # ```
    sig { returns(::String) }
    def self.suffix; end

    # Produces a superhero descriptor.
    # 
    # ```ruby
    # Faker::Superhero.descriptor #=> "Bizarro"
    # ```
    sig { returns(::String) }
    def self.descriptor; end

    # Produces a random superhero name.
    # 
    # ```ruby
    # Faker::Superhero.name #=> "Magnificent Shatterstar"
    # ```
    sig { returns(::String) }
    def self.name; end
  end

  class WorldCup < Faker::Base
    # Produces a national team name.
    # 
    # ```ruby
    # Faker::WorldCup.team #=> "Iran"
    # ```
    sig { returns(::String) }
    def self.team; end

    # Produces a city name hosting the World Cup match.
    # 
    # ```ruby
    # Faker::WorldCup.city #=> "Moscow"
    # ```
    sig { returns(::String) }
    def self.city; end

    # Produces the name of a stadium that has hosted a World Cup match.
    # 
    # ```ruby
    # Faker::WorldCup.stadium #=> "Rostov Arena"
    # ```
    sig { returns(::String) }
    def self.stadium; end

    # Produces a random national team name from a group.
    # 
    # ```ruby
    # Faker::WorldCup.group(group: 'group_B') #=> "Spain"
    # ```
    # 
    # ```ruby
    # Faker::WorldCup.group #=> "Russia"
    # ```
    sig { params(legacy_group: T.untyped, group: T.untyped).returns(::String) }
    def self.group(legacy_group = T.unsafe(nil), group: 'group_A'); end

    # Produces a random name from national team roster.
    # 
    # ```ruby
    # Faker::WorldCup.roster #=> "Hector Cuper"
    # ```
    # 
    # ```ruby
    # Faker::WorldCup.roster(country: 'Spain', type: 'forwards') #=> "Diego Costa"
    # ```
    sig do
      params(
        legacy_country: T.untyped,
        legacy_type: T.untyped,
        country: T.untyped,
        type: T.untyped
      ).returns(::String)
    end
    def self.roster(legacy_country = T.unsafe(nil), legacy_type = T.unsafe(nil), country: 'Egypt', type: 'coach'); end
  end

  class BossaNova < Faker::Base
    # Produces the name of a bossa nova artist.
    # 
    # ```ruby
    # Faker::BossaNova.artist #=> "Tom Jobin"
    # ```
    sig { returns(::String) }
    def self.artist; end

    # Produces a bossa nova song.
    # 
    # ```ruby
    # Faker::BossaNova.song #=> "Chega de Saudade"
    # ```
    sig { returns(::String) }
    def self.song; end
  end

  class Fillmurray < Faker::Base
    # Produces the URL of an image from Fill Murray, a site which hosts
    # exclusively photographs of actor Bill Murray.
    # 
    # _@param_ `grayscale` — Whether to return a grayscale image.
    # 
    # _@param_ `width` — The iamage width.
    # 
    # _@param_ `height` — The image height.
    # 
    # ```ruby
    # Faker::Fillmurray.image #=> "https://www.fillmurray.com/300/300"
    # ```
    # 
    # ```ruby
    # Faker::Fillmurray.image(grayscale: true)
    #   #=> "https://fillmurray.com/g/300/300"
    # ```
    # 
    # ```ruby
    # Faker::Fillmurray.image(grayscale: false, width: 200, height: 400)
    #   #=> "https://fillmurray.com/200/400"
    # ```
    sig do
      params(
        legacy_grayscale: T.untyped,
        legacy_width: T.untyped,
        legacy_height: T.untyped,
        grayscale: T::Boolean,
        width: Integer,
        height: Integer
      ).returns(::String)
    end
    def self.image(legacy_grayscale = T.unsafe(nil), legacy_width = T.unsafe(nil), legacy_height = T.unsafe(nil), grayscale: false, width: 200, height: 200); end
  end

  class FunnyName < Faker::Base
    # Retrieves a funny name.
    # 
    # ```ruby
    # Faker::FunnyName.name #=> "Sam Pull"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Retrieves a funny two word name.
    # 
    # ```ruby
    # Faker::FunnyName.two_word_name #=> "Shirley Knot"
    # ```
    sig { returns(::String) }
    def self.two_word_name; end

    # Retrieves a funny three word name.
    # 
    # ```ruby
    # Faker::FunnyName.three_word_name #=> "Carson O. Gin"
    # ```
    sig { returns(::String) }
    def self.three_word_name; end

    # Retrieves a funny four word name.
    # 
    # ```ruby
    # Faker::FunnyName.four_word_name #=> "Maude L. T. Ford"
    # ```
    sig { returns(::String) }
    def self.four_word_name; end

    # Retrieves a funny name with an initial.
    # 
    # ```ruby
    # Faker::FunnyName.name_with_initial #=> "Heather N. Yonn"
    # ```
    sig { returns(::String) }
    def self.name_with_initial; end
  end

  class Restaurant < Faker::Base
    # Produces the name of a restaurant.
    # 
    # ```ruby
    # Faker::Restaurant.name #=> "Curry King"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a type of restaurant.
    # 
    # ```ruby
    # Faker::Restaurant.type #=> "Comfort Food"
    # ```
    sig { returns(::String) }
    def self.type; end

    # Produces a description of a restaurant.
    # 
    # ```ruby
    # Faker::Restaurant.description
    #   #=> "We are committed to using the finest ingredients in our recipes. No food leaves our kitchen that we ourselves would not eat."
    # ```
    sig { returns(::String) }
    def self.description; end

    # Produces a review for a restaurant.
    # 
    # ```ruby
    # Faker::Restaurant.review
    #   #=> "Brand new. Great design. Odd to hear pop music in a Mexican establishment. Music is a bit loud. It should be background."
    # ```
    sig { returns(::String) }
    def self.review; end
  end

  class University < Faker::Base
    # Produces a random university name.
    # 
    # ```ruby
    # Faker::University.name #=> "Eastern Mississippi Academy"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a random university prefix.
    # 
    # ```ruby
    # Faker::University.prefix #=> "Western"
    # ```
    sig { returns(::String) }
    def self.prefix; end

    # Produces a random university suffix.
    # 
    # ```ruby
    # Faker::University.suffix #=> "Academy"
    # ```
    sig { returns(::String) }
    def self.suffix; end

    # Produces a random greek organization.
    # 
    # ```ruby
    # Faker::University.greek_organization #=> "BEX"
    # ```
    sig { returns(::String) }
    def self.greek_organization; end

    # Produces a greek alphabet.
    # 
    # ```ruby
    # Faker::University.greek_alphabet #=> ["Α", "B", "Γ", "Δ", ...]
    # ```
    sig { returns(T::Array[T.untyped]) }
    def self.greek_alphabet; end
  end

  class UniqueGenerator
    class << self
      # Returns the value of attribute marked_unique.
      sig { returns(T.untyped) }
      attr_reader :marked_unique
    end

    sig { params(generator: T.untyped, max_retries: T.untyped).void }
    def initialize(generator, max_retries); end

    # rubocop:disable Lint/MissingSuper
    sig { params(name: T.untyped, arguments: T.untyped).returns(T.untyped) }
    def method_missing(name, *arguments); end

    sig { params(method_name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
    def respond_to_missing?(method_name, include_private = false); end

    sig { returns(T.untyped) }
    def clear; end

    sig { returns(T.untyped) }
    def self.clear; end

    sig { params(name: T.untyped, arguments: T.untyped, values: T.untyped).returns(T.untyped) }
    def exclude(name, arguments, values); end
  end

  class CryptoCoin < Faker::Base
    # Produces a random crypto coin name.
    # 
    # ```ruby
    # Faker::CryptoCoin.coin_name #=> "Bitcoin"
    # ```
    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(::String) }
    def self.coin_name(legacy_coin = T.unsafe(nil), coin: coin_array); end

    # Produces a random crypto coin acronym.
    # 
    # ```ruby
    # Faker::CryptoCoin.acronym #=> "BTC"
    # ```
    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(::String) }
    def self.acronym(legacy_coin = T.unsafe(nil), coin: coin_array); end

    # Produces a random crypto coin logo url.
    # 
    # ```ruby
    # Faker::CryptoCoin.url_logo #=> "https://i.imgur.com/EFz61Ei.png"
    # ```
    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(::String) }
    def self.url_logo(legacy_coin = T.unsafe(nil), coin: coin_array); end

    # Produces a random crypto coin's name, acronym and logo in an array.
    # 
    # ```ruby
    # Faker::CryptoCoin.coin_array #=> ["Dash", "DASH", "https://i.imgur.com/2uX91cb.png"]
    # ```
    sig { returns(T::Array[::String]) }
    def self.coin_array; end

    # Produces a random crypto coin's name, acronym and logo in a hash.
    # 
    # ```ruby
    # Faker::CryptoCoin.coin_hash {:name=>"Ethereum", :acronym=>"ETH", :url_logo=>"https://i.imgur.com/uOPFCXj.png"}
    # ```
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def self.coin_hash; end
  end

  class Demographic < Faker::Base
    # Produces the name of a race.
    # 
    # ```ruby
    # Faker::Demographic.race #=> "Native Hawaiian or Other Pacific Islander"
    # ```
    sig { returns(::String) }
    def self.race; end

    # Produces a level of educational attainment.
    # 
    # ```ruby
    # Faker::Demographic.educational_attainment #=> "GED or alternative credential"
    # ```
    sig { returns(::String) }
    def self.educational_attainment; end

    # Produces a denonym.
    # 
    # ```ruby
    # Faker::Demographic.denonym #=> "Panamanian"
    # ```
    sig { returns(::String) }
    def self.demonym; end

    # Produces a marital status.
    # 
    # ```ruby
    # Faker::Demographic.marital_status #=> "Widowed"
    # ```
    sig { returns(::String) }
    def self.marital_status; end

    # Produces a sex for demographic purposes.
    # 
    # ```ruby
    # Faker::Demographic.sex #=> "Female"
    # ```
    sig { returns(::String) }
    def self.sex; end

    # Produces a height as a string.
    # 
    # _@param_ `unit` — either `:metric` or `imperial`.
    # 
    # ```ruby
    # Faker::Demographic.height #=> "1.61"
    # ```
    # 
    # ```ruby
    # Faker::Demographic.height(unit: :imperial) #=> "6 ft, 2 in"
    # ```
    sig { params(legacy_unit: T.untyped, unit: Symbol).returns(::String) }
    def self.height(legacy_unit = T.unsafe(nil), unit: :metric); end
  end

  class LoremPixel < Faker::Base
    # Produces a random image URL from lorempixel.com.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the size of image to generate.
    # 
    # _@param_ `is_gray` — Determines if the image is gray.
    # 
    # _@param_ `category` — Adds the category of the generated image to the URL.
    # 
    # _@param_ `number` — Adds a number as part of the URL.
    # 
    # _@param_ `text` — Adds dummy text as part of the URL.
    # 
    # _@param_ `secure` — Changes the image URL between http and https.
    # 
    # ```ruby
    # Faker::LoremPixel.image #=> "https://lorempixel.com/300/300"
    # Faker::LoremPixel.image(size: "50x60") #=> "https://lorempixel.com/50/60"
    # Faker::LoremPixel.image(size: "50x60", is_gray: true) #=> "https://lorempixel.com/g/50/60"
    # Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports') #=> "https://lorempixel.com/50/60/sports"
    # Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: 3) #=> "https://lorempixel.com/50/60/sports/3"
    # Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: 3, text: 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/3/Dummy-text"
    # Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: nil, text: 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/Dummy-text"
    # Faker::LoremPixel.image(secure: false) #=> "http://lorempixel.com/300/300"
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_is_gray: T.untyped,
        legacy_category: T.untyped,
        legacy_number: T.untyped,
        legacy_text: T.untyped,
        legacy_secure: T.untyped,
        size: ::String,
        is_gray: T::Boolean,
        category: T.nilable(Symbol),
        number: T.nilable(Integer),
        text: T.nilable(Integer),
        secure: T::Boolean
      ).returns(::String)
    end
    def self.image(legacy_size = T.unsafe(nil), legacy_is_gray = T.unsafe(nil), legacy_category = T.unsafe(nil), legacy_number = T.unsafe(nil), legacy_text = T.unsafe(nil), legacy_secure = T.unsafe(nil), size: '300x300', is_gray: false, category: nil, number: nil, text: nil, secure: true); end
  end

  class Measurement < Faker::Base
    # Produces a random height measurement.
    # 
    # _@param_ `amount` — Speficies the random height value.
    # 
    # ```ruby
    # Faker::Measurement.height #=> "6 inches"
    # Faker::Measurement.height(amount: 1.4) #=> "1.4 inches"
    # Faker::Measurement.height(amount: "none") #=> "inch"
    # Faker::Measurement.height(amount: "all") #=> "inches"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.height(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random length measurement.
    # 
    # _@param_ `amount` — Speficies the random length value.
    # 
    # ```ruby
    # Faker::Measurement.length #=> "1 yard"
    # Faker::Measurement.length(amount: 1.4) #=> "1.4 yards"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.length(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random volume measurement.
    # 
    # _@param_ `amount` — Speficies the random volume value.
    # 
    # ```ruby
    # Faker::Measurement.volume #=> "10 cups"
    # Faker::Measurement.volume(amount: 1.4) #=> "1.4 cups"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.volume(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random weight measurement.
    # 
    # _@param_ `amount` — Speficies the random weight value.
    # 
    # ```ruby
    # Faker::Measurement.weight #=> "3 pounds"
    # Faker::Measurement.weight(amount: 1.4) #=> "1.4 pounds"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.weight(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random metric height measurement.
    # 
    # _@param_ `amount` — Speficies the random height value.
    # 
    # ```ruby
    # Faker::Measurement.metric_height #=> "2 meters"
    # Faker::Measurement.metric_height(amount: 1.4) #=> "1.4 meters"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.metric_height(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random metric length measurement.
    # 
    # _@param_ `amount` — Speficies the random length value.
    # 
    # ```ruby
    # Faker::Measurement.metric_length #=> "0 decimeters"
    # Faker::Measurement.metric_length(amount: 1.4) #=> "1.4 decimeters"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.metric_length(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random metric volume measurement.
    # 
    # _@param_ `amount` — Speficies the random volume value.
    # 
    # ```ruby
    # Faker::Measurement.metric_volume #=> "1 liter"
    # Faker::Measurement.metric_volume(amount: 1.4) #=> "1.4 liters"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.metric_volume(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    # Produces a random metric weight measurement.
    # 
    # _@param_ `amount` — Speficies the random weight value.
    # 
    # ```ruby
    # Faker::Measurement.metric_weight #=> "8 grams"
    # Faker::Measurement.metric_weight(amount: 1.4) #=> "1.4 grams"
    # ```
    sig { params(legacy_amount: T.untyped, amount: Integer).returns(::String) }
    def self.metric_weight(legacy_amount = T.unsafe(nil), amount: rand(10)); end

    sig { params(text: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.check_for_plural(text, number); end

    sig { params(amount: T.untyped, locale: T.untyped).returns(T.untyped) }
    def self.define_measurement_locale(amount, locale); end

    sig { params(amount: T.untyped).returns(T.untyped) }
    def self.ensure_valid_amount(amount); end

    sig { params(text: T.untyped).returns(T.untyped) }
    def self.make_plural(text); end
  end

  class Placeholdit < Faker::Base
    # Produces a random placeholder image from https://placehold.it.
    # 
    #   Faker::Placeholdit.image #=> "https://placehold.it/300x300.png"
    #   Faker::Placeholdit.image(size: '50x50') #=> "https://placehold.it/50x50.png"
    #   Faker::Placeholdit.image(size: '50x50', format: 'jpg') #=> "https://placehold.it/50x50.jpg"
    #   Faker::Placeholdit.image(size: '50x50', format: 'gif', background_color: 'ffffff') #=> "https://placehold.it/50x50.gif/ffffff"
    #   Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: :random) #=> "https://placehold.it/50x50.jpeg/39eba7"
    #   Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: 'ffffff', text_color: '000') #=> "https://placehold.it/50x50.jpeg/ffffff/000"
    #   Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text') #=> "https://placehold.it/50x50.jpg/ffffff/000?text=Some Custom Text"
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the image's size, dimensions separated by 'x'.
    # 
    # _@param_ `format` — Specifies the image's extension.
    # 
    # _@param_ `background_color` — Specifies the background color, either in hexadecimal format (without #) or as :random.
    # 
    # _@param_ `text_color` — Specifies the text color, either in hexadecimal format (without #) or as :random.
    # 
    # _@param_ `text` — Specifies a custom text to be used.
    # 
    # ```ruby
    # # Keyword arguments: size, format, background_color, text_color, text
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_format: T.untyped,
        legacy_background_color: T.untyped,
        legacy_text_color: T.untyped,
        legacy_text: T.untyped,
        size: ::String,
        format: ::String,
        background_color: T.nilable(T.any(String, Symbol)),
        text_color: T.nilable(T.any(String, Symbol)),
        text: T.nilable(::String)
      ).returns(::String)
    end
    def self.image(legacy_size = T.unsafe(nil), legacy_format = T.unsafe(nil), legacy_background_color = T.unsafe(nil), legacy_text_color = T.unsafe(nil), legacy_text = T.unsafe(nil), size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil); end

    sig { returns(T.untyped) }
    def self.generate_color; end
  end

  class SlackEmoji < Faker::Base
    # Produces a random slack emoji from people category.
    # 
    # ```ruby
    # Faker::SlackEmoji.people #=> ":sleepy:"
    # ```
    sig { returns(::String) }
    def self.people; end

    # Produces a random slack emoji from nature category.
    # 
    # ```ruby
    # Faker::SlackEmoji.nature #=> ":mount_fuji:"
    # ```
    sig { returns(::String) }
    def self.nature; end

    # Produces a random slack emoji from food and drink category.
    # 
    # ```ruby
    # Faker::SlackEmoji.food_and_drink #=> ":beers:"
    # ```
    sig { returns(::String) }
    def self.food_and_drink; end

    # Produces a random slack emoji from celebration category.
    # 
    # ```ruby
    # Faker::SlackEmoji.celebration #=> ":tada:"
    # ```
    sig { returns(::String) }
    def self.celebration; end

    # Produces a random slack emoji from activity category.
    # 
    # ```ruby
    # Faker::SlackEmoji.activity #=> ":soccer:"
    # ```
    sig { returns(::String) }
    def self.activity; end

    # Produces a random slack emoji from travel and places category.
    # 
    # ```ruby
    # Faker::SlackEmoji.travel_and_places #=> ":metro:"
    # ```
    sig { returns(::String) }
    def self.travel_and_places; end

    # Produces a random slack emoji from objects and symbols category.
    # 
    # ```ruby
    # Faker::SlackEmoji.objects_and_symbols #=> ":id:"
    # ```
    sig { returns(::String) }
    def self.objects_and_symbols; end

    # Produces a random slack emoji from custom category.
    # 
    # ```ruby
    # Faker::SlackEmoji.custom #=> ":slack:"
    # ```
    sig { returns(::String) }
    def self.custom; end

    # Produces a random slack emoji from any category.
    # 
    # ```ruby
    # Faker::SlackEmoji.emoji #=> ":pizza:"
    # ```
    sig { returns(::String) }
    def self.emoji; end
  end

  class Alphanumeric < Faker::Base
    # Produces a random string of alphabetic characters (no digits)
    # 
    # _@param_ `number` — The length of the string to generate
    # 
    # ```ruby
    # Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"
    # ```
    sig { params(legacy_number: T.untyped, number: Integer).returns(::String) }
    def self.alpha(legacy_number = T.unsafe(nil), number: 32); end

    # Produces a random string of alphanumeric characters
    # 
    # _@param_ `number` — The number of characters to generate
    # 
    # _@param_ `min_alpha` — The minimum number of alphabetic to add to the string
    # 
    # _@param_ `min_numeric` — The minimum number of numbers to add to the string
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10) #=> "3yfq2phxtb"
    # ```
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3) #=> "3yfq2phxtb"
    # ```
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) #=> "3yfq2phx8b"
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        number: Integer,
        min_alpha: Integer,
        min_numeric: Integer
      ).returns(::String)
    end
    def self.alphanumeric(legacy_number = T.unsafe(nil), number: 32, min_alpha: 0, min_numeric: 0); end
  end

  class ChuckNorris < Faker::Base
    # Produces a Chuck Norris Fact.
    # Original list of facts:
    # https://github.com/jenkinsci/chucknorris-plugin/blob/master/src/main/java/hudson/plugins/chucknorris/FactGenerator.java
    # 
    # ```ruby
    # Faker::ChuckNorris.fact
    #   #=> "Chuck Norris can solve the Towers of Hanoi in one move."
    # ```
    sig { returns(::String) }
    def self.fact; end
  end

  class Construction < Faker::Base
    # Produces a random material.
    # 
    # ```ruby
    # Faker::Construction.material #=> "Wood"
    # ```
    sig { returns(::String) }
    def self.material; end

    # Produces a random heavy equipment.
    # 
    # ```ruby
    # Faker::Construction.heavy_equipment #=> "Excavator"
    # ```
    sig { returns(::String) }
    def self.heavy_equipment; end

    # Produces a random trade.
    # 
    # ```ruby
    # Faker::Construction.trade #=> "Carpenter"
    # ```
    sig { returns(::String) }
    def self.trade; end

    # Produces a random subcontract category.
    # 
    # ```ruby
    # Faker::Construction.subcontract_category #=> "Curb & Gutter"
    # ```
    sig { returns(::String) }
    def self.subcontract_category; end

    # Produces a random standard cost code.
    # 
    # ```ruby
    # Faker::Construction.standard_cost_code #=> "1-000 - Purpose"
    # ```
    sig { returns(::String) }
    def self.standard_cost_code; end

    # Produces a random role.
    # 
    # ```ruby
    # Faker::Construction.role #=> "Engineer"
    # ```
    sig { returns(::String) }
    def self.role; end
  end

  class LoremFlickr < Faker::Base
    # Produces a random image URL from loremflickr.com.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the size of image to generate.
    # 
    # _@param_ `search_terms` — Adds search terms to the image URL.
    # 
    # _@param_ `match_all` — Add "all" as part of the URL.
    # 
    # ```ruby
    # Faker::LoremFlickr.image #=> "https://loremflickr.com/300/300"
    # Faker::LoremFlickr.image(size: "50x60") #=> "https://loremflickr.com/50/60"
    # Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/50/60/sports"
    # Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/50/60/sports,fitness"
    # Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/50/60/sports,fitness/all"
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: ::String,
        search_terms: T::Array[::String],
        match_all: T::Boolean
      ).returns(::String)
    end
    def self.image(legacy_size = T.unsafe(nil), legacy_search_terms = T.unsafe(nil), legacy_match_all = T.unsafe(nil), size: '300x300', search_terms: [], match_all: false); end

    # Produces a random grayscale image URL from loremflickr.com.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the size of image to generate.
    # 
    # _@param_ `search_terms` — Adds search terms to the image URL.
    # 
    # _@param_ `match_all` — Add "all" as part of the URL.
    # 
    # ```ruby
    # Faker::LoremFlickr.grayscale_image #=> "https://loremflickr.com/g/300/300/all"
    # Faker::LoremFlickr.grayscale_image(size: "50x60") #=> "https://loremflickr.com/g/50/60/all"
    # Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/g/50/60/sports"
    # Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/50/60/g/sports,fitness"
    # Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/g/50/60/sports,fitness/all"
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: ::String,
        search_terms: T::Array[::String],
        match_all: T::Boolean
      ).returns(::String)
    end
    def self.grayscale_image(legacy_size = T.unsafe(nil), legacy_search_terms = T.unsafe(nil), legacy_match_all = T.unsafe(nil), size: '300x300', search_terms: ['all'], match_all: false); end

    # Produces a random pixelated image URL from loremflickr.com.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the size of image to generate.
    # 
    # _@param_ `search_terms` — Adds search terms to the image URL.
    # 
    # _@param_ `match_all` — Add "all" as part of the URL.
    # 
    # ```ruby
    # Faker::LoremFlickr.pixelated_image #=> "https://loremflickr.com/p/300/300/all"
    # Faker::LoremFlickr.pixelated_image(size: "50x60") #=> "https://loremflickr.com/p/50/60/all"
    # Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/p/50/60/sports"
    # Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/p/50/60/sports,fitness"
    # Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/p/50/60/sports,fitness/all"
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: ::String,
        search_terms: T::Array[::String],
        match_all: T::Boolean
      ).returns(::String)
    end
    def self.pixelated_image(legacy_size = T.unsafe(nil), legacy_search_terms = T.unsafe(nil), legacy_match_all = T.unsafe(nil), size: '300x300', search_terms: ['all'], match_all: false); end

    # Produces a random colorized image URL from loremflickr.com.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `size` — Specifies the size of image to generate.
    # 
    # _@param_ `color` — Specifies the color of image to generate.
    # 
    # _@param_ `search_terms` — Adds search terms to the image URL.
    # 
    # _@param_ `match_all` — Add "all" as part of the URL.
    # 
    # ```ruby
    # Faker::LoremFlickr.image #=> "https://loremflickr.com/red/300/300/all"
    # Faker::LoremFlickr.image(size: "50x60", color: 'blue') #=> "https://loremflickr.com/blue/50/60/all"
    # Faker::LoremFlickr.image(size: "50x60", color: 'blue', search_terms: ['sports']) #=> "https://loremflickr.com/blue/50/60/sports"
    # Faker::LoremFlickr.image(size: "50x60", color: 'blue', search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/blue/50/60/sports,fitness"
    # Faker::LoremFlickr.image(size: "50x60", color: 'blue', search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/blue/50/60/sports,fitness/all"
    # ```
    sig do
      params(
        legacy_size: T.untyped,
        legacy_color: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: ::String,
        color: ::String,
        search_terms: T::Array[::String],
        match_all: T::Boolean
      ).returns(::String)
    end
    def self.colorized_image(legacy_size = T.unsafe(nil), legacy_color = T.unsafe(nil), legacy_search_terms = T.unsafe(nil), legacy_match_all = T.unsafe(nil), size: '300x300', color: 'red', search_terms: ['all'], match_all: false); end

    sig do
      params(
        size: T.untyped,
        format: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.build_url(size, format, search_terms, match_all); end
  end

  class PhoneNumber < Faker::Base
    # Produces a random phone number in a random format (may or may not have a country code, extension and can have different dividers).
    # 
    # ```ruby
    # Faker::PhoneNumber.phone_number #=> "397.693.1309 x4321"
    # ```
    sig { returns(::String) }
    def self.phone_number; end

    # Produces a random cell phone number in a random format (may or may not have a country code and can have different dividers).
    # 
    # ```ruby
    # Faker::PhoneNumber.cell_phone #=> "(186)285-7925"
    # ```
    sig { returns(::String) }
    def self.cell_phone; end

    # Produces a random country code.
    # 
    # ```ruby
    # Faker::PhoneNumber.country_code #=> "+20"
    # ```
    sig { returns(::String) }
    def self.country_code; end

    # Produces a random phone number with country code.
    # 
    # ```ruby
    # Faker::PhoneNumber.phone_number_with_country_code #=> "+95 1-672-173-8153"
    # ```
    sig { returns(::String) }
    def self.phone_number_with_country_code; end

    # Produces a random cell phone number with country code.
    # 
    # ```ruby
    # Faker::PhoneNumber.cell_phone_with_country_code #=> "+974 (190) 987-9034"
    # ```
    sig { returns(::String) }
    def self.cell_phone_with_country_code; end

    # Produces a random phone number in e164 format.
    # 
    # ```ruby
    # Faker::PhoneNumber.cell_phone_in_e164 #=> "+944937040625"
    # ```
    sig { returns(::String) }
    def self.cell_phone_in_e164; end

    # Produces a random US or Canada-based area code.
    # 
    # ```ruby
    # Faker::PhoneNumber.area_code #=> "201"
    # ```
    sig { returns(::String) }
    def self.area_code; end

    # Produces a random US or Canada-based exchange code.
    # 
    # ```ruby
    # Faker::PhoneNumber.exchange_code #=> "208"
    # ```
    sig { returns(::String) }
    def self.exchange_code; end

    # Produces a random US or Canada-based extension / subscriber number. Can be used for both extensions and last four digits of phone number.
    # 
    # _@param_ `length` — Speficies the length of the return value.
    # 
    # ```ruby
    # Faker::PhoneNumber.subscriber_number #=> "3873"
    # Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"
    # Faker::PhoneNumber.extension #=> "3764"
    # ```
    sig { params(legacy_length: T.untyped, length: Integer).returns(::String) }
    def self.subscriber_number(legacy_length = T.unsafe(nil), length: 4); end
  end

  class Relationship < Faker::Base
    # Produces a random family relationship.
    # 
    # ```ruby
    # Faker::Relationship.familial #=> "Grandfather"
    # ```
    sig { params(legacy_connection: T.untyped, connection: T.untyped).returns(::String) }
    def self.familial(legacy_connection = T.unsafe(nil), connection: nil); end

    # Produces a random in-law relationship.
    # 
    # ```ruby
    # Faker::Relationship.in_law #=> "Brother-in-law"
    # ```
    sig { returns(::String) }
    def self.in_law; end

    # Produces a random spouse relationship.
    # 
    # ```ruby
    # Faker::Relationship.spouse #=> "Husband"
    # ```
    sig { returns(::String) }
    def self.spouse; end

    # Produces a random parent relationship.
    # 
    # ```ruby
    # Faker::Relationship.parent #=> "Father"
    # ```
    sig { returns(::String) }
    def self.parent; end

    # Produces a random sibling relationship.
    # 
    # ```ruby
    # Faker::Relationship.sibling #=> "Sister"
    # ```
    sig { returns(::String) }
    def self.sibling; end
  end

  class SouthAfrica < Faker::Base
    # Produces a South African ID number.
    # 
    # ```ruby
    # Faker::SouthAfrica.id_number #=> "6110311856083"
    # ```
    sig { returns(::String) }
    def self.id_number; end

    # Produces a valid South African ID number
    # 
    # ```ruby
    # Faker::SouthAfrica.valid_id_number #=> "6110311856083"
    # ```
    sig { returns(::String) }
    def self.valid_id_number; end

    # Produces an invalid South African ID number
    # 
    # ```ruby
    # Faker::SouthAfrica.invalid_id_number #=> "7018356904081"
    # ```
    sig { returns(::String) }
    def self.invalid_id_number; end

    # Produces a South African phone number.
    # 
    # ```ruby
    # Faker::SouthAfrica.phone_number #=> "010 788 5009"
    # ```
    sig { returns(::String) }
    def self.phone_number; end

    # Produces a South African cell phone number.
    # 
    # ```ruby
    # Faker::SouthAfrica.cell_phone #=> "082 946 7470"
    # ```
    sig { returns(::String) }
    def self.cell_phone; end

    # Produces a South African private company registration number.
    # 
    # ```ruby
    # Faker::SouthAfrica.pty_ltd_registration_number #=> "5301/714689/07"
    # ```
    sig { returns(::String) }
    def self.pty_ltd_registration_number; end

    # Produces a South African close corporation registration number.
    # 
    # ```ruby
    # Faker::SouthAfrica.close_corporation_registration_number #=> "CK74/7585/23"
    # ```
    sig { returns(::String) }
    def self.close_corporation_registration_number; end

    # Produces a South African listed company registration number.
    # 
    # ```ruby
    # Faker::SouthAfrica.listed_company_registration_number #=> "7039/3135/06"
    # ```
    sig { returns(::String) }
    def self.listed_company_registration_number; end

    # Produces a South African trust registration number.
    # 
    # ```ruby
    # Faker::SouthAfrica.trust_registration_number #=> "IT38/6489900"
    # ```
    sig { returns(::String) }
    def self.trust_registration_number; end

    # Produces a South African VAT number.
    # 
    # ```ruby
    # Faker::SouthAfrica.vat_number #=> "ZA79494416181"
    # ```
    sig { returns(::String) }
    def self.vat_number; end
  end

  class Subscription < Faker::Base
    # Produces the name of a subscription plan.
    # 
    # ```ruby
    # Faker::Subscription.plan #=> "Platinum"
    # ```
    sig { returns(::String) }
    def self.plan; end

    # Produces a subscription status.
    # 
    # ```ruby
    # Faker::Subscription.status #=> "Active"
    # ```
    sig { returns(::String) }
    def self.status; end

    # Produces the name of a payment method.
    # 
    # ```ruby
    # Faker::Subscription.payment_method #=> "PayPal"
    # ```
    sig { returns(::String) }
    def self.payment_method; end

    # Produces the name of a subscription term.
    # 
    # ```ruby
    # Faker::Subscription.subscription_term #=> "Annual"
    # ```
    sig { returns(::String) }
    def self.subscription_term; end

    # Produces the name of a payment term.
    # 
    # ```ruby
    # Faker::Subscription.payment_term #=> "Monthly"
    # ```
    sig { returns(::String) }
    def self.payment_term; end
  end

  class JapaneseMedia
    class Conan < Faker::Base
      # Produces a character from Conan.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Conan.character #=> "Conan Edogawa"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a gadget from Conan.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Conan.gadget #=> "Voice-Changing Bowtie"
      # ```
      sig { returns(::String) }
      def self.gadget; end

      # Produces a vehicle from Conan.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Conan.vehicle #=> "Agasa's Volkswagen Beetle"
      # ```
      sig { returns(::String) }
      def self.vehicle; end
    end

    class Naruto < Faker::Base
      # Produces a character from Naruto.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Naruto.character #=> "Naruto Uzumaki"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a village from Naruto.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Naruto.village #=> "Konohagakure (Leaf Village)"
      # ```
      sig { returns(::String) }
      def self.village; end

      # Produces a eye from Naruto.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Naruto.eye #=> "Konohagakure (Byakugan)"
      # ```
      sig { returns(::String) }
      def self.eye; end

      # Produces a demon from Naruto.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Naruto.demon #=> "Nine-Tails (Kurama)"
      # ```
      sig { returns(::String) }
      def self.demon; end
    end

    class Doraemon < Faker::Base
      # Produces a character from Doraemon.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Doraemon.character #=> "Nobita"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a gadget from Doraemon.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Doraemon.gadget #=> "Anywhere Door"
      # ```
      sig { returns(::String) }
      def self.gadget; end

      # Produces a location from Doraemon.
      # 
      # ```ruby
      # Faker::JapaneseMedia::Doraemon.location #=> "Tokyo"
      # ```
      sig { returns(::String) }
      def self.location; end
    end

    class OnePiece < Faker::Base
      # Produces a character from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.character #=> "Monkey D. Luffy"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a sea from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.sea #=> "East Blue"
      # ```
      sig { returns(::String) }
      def self.sea; end

      # Produces an island from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.island #=> "Laftel"
      # ```
      sig { returns(::String) }
      def self.island; end

      # Produces a location from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.location #=> "Foosha Village"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces a quote from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.quote #=> "ONE PIECE IS REAL!"
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces an akuma no mi from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.akuma_no_mi #=> "Gomu Gomu no Mi"
      # ```
      sig { returns(::String) }
      def self.akuma_no_mi; end
    end

    class DragonBall < Faker::Base
      # Produces the name of a character from Dragon Ball.
      # 
      # ```ruby
      # Faker::Games::DragonBall.character #=> "Goku"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces the name of a race from Dragon Ball.
      # 
      # ```ruby
      # Faker::Games::DragonBall.race #=> "Saiyan"
      # ```
      sig { returns(::String) }
      def self.race; end

      # Produces the name of a planet from Dragon Ball.
      # 
      # ```ruby
      # Faker::Games::DragonBall.planet #=> "Namek"
      # ```
      sig { returns(::String) }
      def self.planet; end
    end

    class StudioGhibli < Faker::Base
      # Produces a character from the Studio Ghibli.
      # 
      # ```ruby
      # Faker::JapaneseMedia::StudioGhibli.character #=> "Chihiro"
      # ```
      sig { returns(::String) }
      def self.character; end

      # Produces a quote from Studio Ghibli's movies.
      # 
      # ```ruby
      # Faker::JapaneseMedia::StudioGhibli.quote #=> "One thing you can always count on is that hearts change."
      # ```
      sig { returns(::String) }
      def self.quote; end

      # Produces a movie from Studio Ghibli.
      # 
      # ```ruby
      # Faker::JapaneseMedia::StudioGhibli.movie #=> "Kiki's Delivery Service"
      # ```
      sig { returns(::String) }
      def self.movie; end
    end

    class SwordArtOnline < Faker::Base
      # Produces the real name of a character from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.real_name #=> "Kirigaya Kazuto"
      # ```
      sig { returns(::String) }
      def self.real_name; end

      # Produces the in-game name of a character from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.game_name #=> "Silica"
      # ```
      sig { returns(::String) }
      def self.game_name; end

      # Produces the name of a location from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.location #=> "Ruby Palace"
      # ```
      sig { returns(::String) }
      def self.location; end

      # Produces the name of an item from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.item #=> "Blackwyrm Coat"
      # ```
      sig { returns(::String) }
      def self.item; end
    end
  end

  class DrivingLicence < Faker::Base
    # Produces a random British driving licence number.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `last_name` — The last name of the driving licence's owner.
    # 
    # _@param_ `initials` — The initials of the driving licence's owner.
    # 
    # _@param_ `gender` — The gender of the driving licence's owner.
    # 
    # _@param_ `date_of_birth` — The date of birth of the driving licence's owner.
    # 
    # ```ruby
    # Faker::DrivingLicence.british_driving_licence        #=> "MCDER712081VF7EK"
    # Faker::DrivingLicence.british_driving_licence(last_name: "O'Carroll",
    #                                               initials: "J",
    #                                               gender: :female,
    #                                               date_of_birth: ::Date.parse("1986-10-24")) #=> "OCARR815246J91HT"
    # ```
    sig do
      params(
        legacy_last_name: T.untyped,
        legacy_initials: T.untyped,
        legacy_gender: T.untyped,
        legacy_date_of_birth: T.untyped,
        last_name: ::String,
        initials: ::String,
        gender: ::String,
        date_of_birth: ::String
      ).returns(::String)
    end
    def self.british_driving_licence(legacy_last_name = T.unsafe(nil), legacy_initials = T.unsafe(nil), legacy_gender = T.unsafe(nil), legacy_date_of_birth = T.unsafe(nil), last_name: Faker::Name.last_name, initials: Faker::Name.initials, gender: random_gender, date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)); end

    # Produces a random Northern Irish licence number.
    # 
    # ```ruby
    # Faker::DrivingLicence.northern_irish_driving_licence #=> "70702548"
    # ```
    sig { returns(::String) }
    def self.northern_irish_driving_licence; end

    # Produces a random UK driving licence number in either GB or NI format, at a rate consistent with their relative populations
    # 
    # ```ruby
    # Faker::DrivingLicence.uk_driving_licence             #=> "OCARR815246J91HT"
    # Faker::DrivingLicence.uk_driving_licence             #=> "70702548"
    # ```
    sig { params(args: T.untyped).returns(::String) }
    def self.uk_driving_licence(*args); end

    # Produces a random USA driving licence number by state code passed.
    # 
    # ```ruby
    # Faker::DrivingLicence.usa_driving_licence                 #=> "V5598249"
    # Faker::DrivingLicence.usa_driving_licence('new mexico')   #=> "270692028"
    # Faker::DrivingLicence.usa_driving_licence('New Mexico')   #=> "68178637"
    # ```
    sig { params(state: T.untyped).returns(::String) }
    def self.usa_driving_licence(state = 'California'); end

    sig { returns(T.untyped) }
    def self.random_gender; end

    sig { params(str: T.untyped, num_chars: T.untyped).returns(T.untyped) }
    def self.gb_licence_padding(str, num_chars); end

    sig { params(dob: T.untyped, gender: T.untyped).returns(T.untyped) }
    def self.gb_licence_year(dob, gender); end

    sig { returns(T.untyped) }
    def self.gb_licence_checksum; end
  end

  class InvalidStatePassed < StandardError
    sig { params(msg: T.untyped).void }
    def initialize(msg = 'Invalid state code passed'); end
  end

  class Adjective < Faker::Base
    # Produces a positive adjective.
    # 
    # ```ruby
    # Faker::Adjective.positive #=> "Kind"
    # ```
    sig { returns(::String) }
    def self.positive; end

    # Produces a negative adjective.
    # 
    # ```ruby
    # Faker::Adjective.negative #=> "Creepy"
    # ```
    sig { returns(::String) }
    def self.negative; end
  end

  class IndustrySegments < Faker::Base
    # Produces the name of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.industry #=> "Basic Materials"
    # ```
    sig { returns(::String) }
    def self.industry; end

    # Produces the name of a super-sector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.super_sector #=> "Basic Resources"
    # ```
    sig { returns(::String) }
    def self.super_sector; end

    # Produces the name of a sector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.sector #=> "Industrial Metals & Mining"
    # ```
    sig { returns(::String) }
    def self.sector; end

    # Produces the name of a subsector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.industry #=> "Basic Materials"
    # ```
    sig { returns(::String) }
    def self.sub_sector; end
  end

  class GreekPhilosophers < Faker::Base
    # Produces the name of a Greek philosopher.
    # 
    # ```ruby
    # Faker::GreekPhilosophers.name #=> "Socrates"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces a quote from a Greek philosopher.
    # 
    # ```ruby
    # Faker::GreekPhilosophers.quote #=> "Only the educated are free."
    # ```
    sig { returns(::String) }
    def self.quote; end
  end

  class ProgrammingLanguage < Faker::Base
    # Produces the name of a programming language.
    # 
    # ```ruby
    # Faker::ProgrammingLanguage.name #=> "Ruby"
    # ```
    sig { returns(::String) }
    def self.name; end

    # Produces the name of a programming language's creator.
    # 
    # ```ruby
    # Faker::ProgrammingLanguage.creator #=> "Yukihiro Matsumoto"
    # ```
    sig { returns(::String) }
    def self.creator; end
  end

  class ElectricalComponents < Faker::Base
    # Produces an active electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.active #=> "Transistor"
    # ```
    sig { returns(::String) }
    def self.active; end

    # Produces a passive electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.passive #=> "Resistor"
    # ```
    sig { returns(::String) }
    def self.passive; end

    # Produces an electromechanical electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.electromechanical #=> "Toggle Switch"
    # ```
    sig { returns(::String) }
    def self.electromechanical; end
  end

  class NatoPhoneticAlphabet < Faker::Base
    # Produces a code word from the NATO phonetic alphabet.
    # 
    # ```ruby
    # Faker::NatoPhoneticAlphabet.code_word #=> "Hotel"
    # ```
    sig { returns(::String) }
    def self.code_word; end
  end
end
