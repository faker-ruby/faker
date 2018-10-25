![logotype a happy-07](https://user-images.githubusercontent.com/36028424/40263395-4318481e-5b44-11e8-92e5-3dcc1ce169b3.png)

# Faker [![Build Status](https://travis-ci.org/stympy/faker.svg?branch=master)](https://travis-ci.org/stympy/faker) [![Gem Version](https://badge.fury.io/rb/faker.svg)](https://badge.fury.io/rb/faker) [![Test Coverage](https://api.codeclimate.com/v1/badges/ef54c7f9df86e965d64b/test_coverage)](https://codeclimate.com/github/stympy/faker/test_coverage) [![Maintainability](https://api.codeclimate.com/v1/badges/ef54c7f9df86e965d64b/maintainability)](https://codeclimate.com/github/stympy/faker/maintainability)

This gem is a port of Perl's Data::Faker library that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

### NOTE

* While Faker generates data at random, returned values are not guaranteed to be unique by default.
  You must explicity specify when you require unique values, see [details](#ensuring-unique-values).
  Values also can be deterministic if you use the deterministic feature, see [details](#deterministic-random)
* This is the `master` branch of Faker and may contain changes that are not yet released.
  Please refer the README of your version for the available methods.
  List of all versions is [available here](https://github.com/stympy/faker/releases).

Contents
--------

- [Installing](#installing)
- [Usage](#usage)
  - [Faker::Address](doc/1.9.1/address.md)
  - [Faker::Ancient](doc/1.9.1/ancient.md)
  - [Faker::App](doc/1.9.1/app.md)
  - [Faker::Appliance](doc/1.9.1/appliance.md)
  - [Faker::Artist](doc/1.9.1/artist.md)
  - [Faker::AquaTeenHungerForce](doc/1.9.1/aqua_teen_hunger_force.md)
  - [Faker::Avatar](doc/1.9.1/avatar.md)
  - [Faker::BackToTheFuture](doc/1.9.1/back_to_the_future.md)
  - [Faker::Bank](doc/1.9.1/bank.md)
  - [Faker::Beer](doc/1.9.1/beer.md)
  - [Faker::Bitcoin](doc/1.9.1/bitcoin.md)
  - [Faker::BojackHorseman](doc/1.9.1/bojack_horseman.md)
  - [Faker::Book](doc/1.9.1/book.md)
  - [Faker::Boolean](doc/1.9.1/boolean.md)
  - [Faker::BossaNova](doc/1.9.1/bossa_nova.md)
  - [Faker::BreakingBad](doc/1.9.1/breaking_bad.md)
  - [Faker::Business](doc/1.9.1/business.md)
  - [Faker::Cannabis](doc/1.9.1/cannabis.md)
  - [Faker::Cat](doc/1.9.1/cat.md)
  - [Faker::ChuckNorris](doc/1.9.1/chuck_norris.md)
  - [Faker::Code](doc/1.9.1/code.md)
  - [Faker::Coffee](doc/1.9.1/coffee.md)
  - [Faker::Color](doc/1.9.1/color.md)
  - [Faker::Commerce](doc/1.9.1/commerce.md)
  - [Faker::Community](doc/1.9.1/community.md)
  - [Faker::Company](doc/1.9.1/company.md)
  - [Faker::Compass](doc/1.9.1/compass.md)
  - [Faker::Crypto](doc/1.9.1/crypto.md)
  - [Faker::Currency](doc/1.9.1/currency.md)
  - [Faker::Date](doc/1.9.1/date.md)
  - [Faker::Demographic](doc/1.9.1/demographic.md)
  - [Faker::Dessert](doc/1.9.1/dessert.md)
  - [Faker::Device](doc/1.9.1/device.md)
  - [Faker::Dog](doc/1.9.1/dog.md)
  - [Faker::Dota](doc/1.9.1/dota.md)
  - [Faker::DrWho](doc/1.9.1/dr_who.md)
  - [Faker::DragonBall](doc/1.9.1/dragon_ball.md)
  - [Faker::DumbAndDumber](doc/1.9.1/dumb_and_dumber.md)
  - [Faker::Dune](doc/1.9.1/dune.md)
  - [Faker::Educator](doc/1.9.1/educator.md)
  - [Faker::ElderScrolls](doc/1.9.1/elder_scrolls.md)
  - [Faker::ElectricalComponents](doc/1.9.1/electrical_components.md)
  - [Faker::Esport](doc/1.9.1/esport.md)
  - [Faker::Ethereum](doc/1.9.1/ethereum.md)
  - [Faker::Fallout](doc/1.9.1/fallout.md)
  - [Faker::FamilyGuy](doc/1.9.1/family_guy.md)
  - [Faker::FamousLastWords](doc/1.9.1/famous_last_words.md)
  - [Faker::File](doc/1.9.1/file.md)
  - [Faker::Fillmurray](doc/1.9.1/fillmurray.md)
  - [Faker::Finance](doc/1.9.1/finance.md)
  - [Faker::Food](doc/1.9.1/food.md)
  - [Faker::Football](doc/1.9.1/football.md)
  - [Faker::Friends](doc/1.9.1/friends.md)
  - [Faker::FunnyName](doc/1.9.1/funny_name.md)
  - [Faker::GameOfThrones](doc/1.9.1/game_of_thrones.md)
  - [Faker::Gender](doc/1.9.1/gender.md)
  - [Faker::GreekPhilosophers](doc/1.9.1/greek_philosophers.md)
  - [Faker::Hacker](doc/1.9.1/hacker.md)
  - [Faker::HarryPotter](doc/1.9.1/harry_potter.md)
  - [Faker::HeyArnold](doc/1.9.1/hey_arnold.md)
  - [Faker::Hipster](doc/1.9.1/hipster.md)
  - [Faker::HitchhikersGuideToTheGalaxy](doc/1.9.1/hitchhikers_guide_to_the_galaxy.md)
  - [Faker::Hobbit](doc/1.9.1/hobbit.md)
  - [Faker::HowIMetYourMother](doc/1.9.1/how_i_met_your_mother.md)
  - [Faker::IDNumber](doc/1.9.1/id_number.md)
  - [Faker::Internet](doc/1.9.1/internet.md)
  - [Faker::Invoice](doc/1.9.1/invoice.md)
  - [Faker::Job](doc/1.9.1/job.md)
  - [Faker::Kpop](doc/1.9.1/kpop.md)
  - [Faker::LeagueOfLegends](doc/1.9.1/league_of_legends.md)
  - [Faker::Lebowski](doc/1.9.1/lebowski.md)
  - [Faker::LordOfTheRings](doc/1.9.1/lord_of_the_rings.md)
  - [Faker::Lorem](doc/1.9.1/lorem.md)
  - [Faker::LoremFlickr](doc/1.9.1/lorem_flickr.md)
  - [Faker::LoremPixel](doc/1.9.1/lorem_pixel.md)
  - [Faker::Lovecraft](doc/1.9.1/lovecraft.md)
  - [Faker::Markdown](doc/1.9.1/markdown.md)
  - [Faker::Matz](doc/1.9.1/matz.md)
  - [Faker::Measurement](doc/1.9.1/measurement.md)
  - [Faker::MichaelScott](doc/1.9.1/michael_scott.md)
  - [Faker::Military](doc/1.9.1/military.md)
  - [Faker::MostInterestingManInTheWorld](doc/1.9.1/most_interesting_man_in_the_world.md)
  - [Faker::Movie](doc/1.9.1/movie.md)
  - [Faker::Music](doc/1.9.1/music.md)
  - [Faker::Myst](doc/1.9.1/myst.md)
  - [Faker::Name](doc/1.9.1/name.md)
  - [Faker::Nation](doc/1.9.1/nation.md)
  - [Faker::NatoPhoneticAlphabet](doc/1.9.1/nato_phonetic_alphabet.md)
  - [Faker::NewGirl](doc/1.9.1/new_girl.md)
  - [Faker::Number](doc/1.9.1/number.md)
  - [Faker::Omniauth](doc/1.9.1/omniauth.md)
  - [Faker::OnePiece](doc/1.9.1/one_piece.md)
  - [Faker::Overwatch](doc/1.9.1/overwatch.md)
  - [Faker::ParksAndRec](doc/1.9.1/parks_and_rec.md)
  - [Faker::PhoneNumber](doc/1.9.1/phone_number.md)
  - [Faker::Placeholdit](doc/1.9.1/placeholdit.md)
  - [Faker::Pokemon](doc/1.9.1/pokemon.md)
  - [Faker::PrincessBride](doc/1.9.1/princess_bride.md)
  - [Faker::ProgrammingLanguage](doc/1.9.1/programming_language.md)
  - [Faker::RickAndMorty](doc/1.9.1/rick_and_morty.md)
  - [Faker::Robin](doc/1.9.1/robin.md)
  - [Faker::RockBand](doc/1.9.1/rock_band.md)
  - [Faker::RuPaul](doc/1.9.1/rupaul.md)
  - [Faker::Science](doc/1.9.1/science.md)
  - [Faker::Seinfeld](doc/1.9.1/seinfeld.md)
  - [Faker::SiliconValley](doc/1.9.1/silicon_valley.md)
  - [Faker::Simpsons](doc/1.9.1/simpsons.md)
  - [Faker::SingularSiegler](doc/1.9.1/singular_siegler.md)
  - [Faker::SlackEmoji](doc/1.9.1/slack_emoji.md)
  - [Faker::Source](doc/1.9.1/source.md)
  - [Faker::Space](doc/1.9.1/space.md)
  - [Faker::StarTrek](doc/1.9.1/star_trek.md)
  - [Faker::StarWars](doc/1.9.1/star_wars.md)
  - [Faker::StrangerThings](doc/1.9.1/stranger_things.md)
  - [Faker::String](doc/1.9.1/string.md)
  - [Faker::Stripe](doc/1.9.1/stripe.md)
  - [Faker::Superhero](doc/1.9.1/superhero.md)
  - [Faker::SwordArtOnline](doc/1.9.1/sword_art_online.md)
  - [Faker::Team](doc/1.9.1/team.md)
  - [Faker::TheFreshPrinceOfBelAir](doc/1.9.1/the_fresh_prince_of_bel_air.md)
  - [Faker::TheITCrowd](doc/1.9.1/the_it_crowd.md)
  - [Faker::TheThickOfIt](doc/1.9.1/the_thick_of_it.md)
  - [Faker::Time](doc/1.9.1/time.md)
  - [Faker::TwinPeaks](doc/1.9.1/twin_peaks.md)
  - [Faker::Twitter](doc/1.9.1/twitter.md)
  - [Faker::Types](doc/1.9.1/types.md)
  - [Faker::UmphreysMcgee](doc/1.9.1/umphreys_mcgee.md)
  - [Faker::University](doc/1.9.1/university.md)
  - [Faker::Vehicle](doc/1.9.1/vehicle.md)
  - [Faker::VentureBros](doc/1.9.1/venture_bros.md)
  - [Faker::VForVendetta](doc/1.9.1/v_for_vendetta.md)
  - [Faker::Witcher](doc/1.9.1/witcher.md)
  - [Faker::WorldCup](doc/1.9.1/world_cup.md)
  - [Faker::WorldOfWarcraft](doc/1.9.1/world_of_warcraft.md)
  - [Faker::Zelda](doc/1.9.1/zelda.md)
- [Customization](#customization)
- [Contributing](#contributing)
- [Contact](#contact)
- [License](#license)

## Installing

```bash
gem install faker
```
Note: if you are getting a `uninitialized constant Faker::[some_class]` error, your version of the gem is behind the one documented here. To make sure that your gem is the one documented here, change the line in your gemfile to:

```ruby
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
```

* To access the full list of unreleased Faker object is [available here](unreleased_README.md).

## Usage

```ruby
require 'faker'

Faker::Name.name      #=> "Christophe Bartell"

Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
```

### Ensuring unique values

Prefix your method call with `unique`. For example:
```ruby
Faker::Name.unique.name # This will return a unique name every time it is called
```

If too many unique values are requested from a generator that has a limited
number of potential values, a `Faker::UniqueGenerator::RetryLimitExceeded`
exception may be raised. It is possible to clear the record of unique values
that have been returned, for example between tests.
```ruby
Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generators
```

You also can give some already used values to the unique generator if you have
collisions with the generated data (i.e: using FactoryBot with random and
manually set values).

```ruby
# Usage:
# Faker::<generator>.unique.exclude(method, arguments, list)

# Add 'azerty' and 'wxcvbn' to the string generator with 6 char length
Faker::Lorem.unique.exclude :string, [6], %w[azerty wxcvbn]
```

### Deterministic Random

Faker supports seeding of its pseudo-random number generator (PRNG) to provide deterministic output of repeated method calls.

```ruby
Faker::Config.random = Random.new(42)
Faker::Company.bs #=> "seize collaborative mindshare"
Faker::Company.bs #=> "engage strategic platforms"
Faker::Config.random = Random.new(42)
Faker::Company.bs #=> "seize collaborative mindshare"
Faker::Company.bs #=> "engage strategic platforms"

Faker::Config.random = nil # seeds the PRNG using default entropy sources
Faker::Config.random.seed #=> 185180369676275068918401850258677722187
Faker::Company.bs #=> "cultivate viral synergies"
```

## Customization

Since you may want to make addresses and other types of data look different
depending on where in the world you are (US postal codes vs. UK postal codes,
for example), Faker uses the I18n gem to store strings (like state names) and
formats (US postal codes are NNNNN while UK postal codes are AAN NAA),
allowing you to get different formats by switching locales.  Just set
Faker::Config.locale to the locale you want, and Faker will take care of the
rest.

If your locale doesn't already exist, create it in the \lib\locales\ directory
and you can then override or add elements to suit your needs. See more about how to
use locales [here](lib/locales/README.md)

```yaml

en-au-ocker:
  faker:
    name:
      # Existing faker field, new data
      first_name: [Charlotte, Ava, Chloe, Emily]

      # New faker fields
      ocker_first_name: [Bazza, Bluey, Davo, Johno, Shano, Shazza]
      region: [South East Queensland, Wide Bay Burnett, Margaret River, Port Pirie, Gippsland, Elizabeth, Barossa]

```

## Contributing

See [CONTRIBUTING.md](https://github.com/stympy/faker/blob/master/CONTRIBUTING.md).

## Contact

Comments and feedback are welcome. Send an email to Benjamin Curtis via the [google group](http://groups.google.com/group/ruby-faker).

## License

This code is free to use under the terms of the MIT license.
