# Faker [![Build Status](https://travis-ci.org/stympy/faker.svg?branch=master)](https://travis-ci.org/stympy/faker) [![Gem Version](https://badge.fury.io/rb/faker.svg)](https://badge.fury.io/rb/faker)


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
  - [Faker::Address](doc/address.md)
  - [Faker::Ancient](doc/ancient.md)
  - [Faker::App](doc/app.md)
  - [Faker::Avatar](doc/avatar.md)
  - [Faker::Bank](doc/bank.md)
  - [Faker::Beer](doc/beer.md)
  - [Faker::Bitcoin](doc/bitcoin.md)
  - [Faker::Book](doc/book.md)
  - [Faker::Boolean](doc/boolean.md)
  - [Faker::BossaNova](doc/bossa_nova.md)
  - [Faker::Business](doc/business.md)
  - [Faker::Cat](doc/cat.md)
  - [Faker::ChuckNorris](doc/chuck_norris.md)
  - [Faker::Code](doc/code.md)
  - [Faker::Coffee](doc/coffee.md)
  - [Faker::Color](doc/color.md)
  - [Faker::Commerce](doc/commerce.md)
  - [Faker::Company](doc/company.md)
  - [Faker::Compass](doc/compass.md)
  - [Faker::Crypto](doc/crypto.md)
  - [Faker::Date](doc/date.md)
  - [Faker::Demographic](doc/demographic.md)
  - [Faker::Dessert](doc/dessert.md)
  - [Faker::DragonBall](doc/dragon_ball.md)
  - [Faker::DrWho](doc/dr_who.md)
  - [Faker::Educator](doc/educator.md)
  - [Faker::ElderScrolls](doc/elder_scrolls.md)
  - [Faker::FamilyGuy](doc/family_guy.md)
  - [Faker::File](doc/file.md)
  - [Faker::Fillmurray](doc/fillmurray.md)
  - [Faker::Food](doc/food.md)
  - [Faker::Friends](doc/friends.md)
  - [Faker::GameOfThrones](doc/game_of_thrones.md)
  - [Faker::Hacker](doc/hacker.md)
  - [Faker::HarryPotter](doc/harry_potter.md)
  - [Faker::HeyArnold](doc/hey_arnold.md)
  - [Faker::Hipster](doc/hipster.md)
  - [Faker::Hobbit](doc/hobbit.md)
  - [Faker::HowIMetYourMother](doc/how_i_met_your_mother.md)
  - [Faker::HitchhikersGuideToTheGalaxy](doc/hitchhikers_guide_to_the_galaxy.md)
  - [Faker::Internet](doc/internet.md)
  - [Faker::Job](doc/job.md)
  - [Faker::LeagueOfLegends](doc/league_of_legends.md)
  - [Faker::LordOfTheRings](doc/lord_of_the_rings.md)
  - [Faker::LoremPixel](doc/lorem_pixel.md)
  - [Faker::Lorem](doc/lorem.md)
  - [Faker::Lovecraft](doc/lovecraft.md)
  - [Faker::Markdown](doc/markdown.md)
  - [Faker::Matz](doc/matz.md)
  - [Faker::Measurement](doc/measurement.md)
  - [Faker::MostInterestingManInTheWorld](doc/most_interesting_man_in_the_world.md)
  - [Faker::Movie](doc/movie.md)
  - [Faker::Music](doc/music.md)
  - [Faker::Name](doc/name.md)
  - [Faker::Number](doc/number.md)
  - [Faker::Omniauth](doc/omniauth.md)
  - [Faker::Overwatch](doc/overwatch.md)
  - [Faker::PhoneNumber](doc/phone_number.md)
  - [Faker::Placeholdit](doc/placeholdit.md)
  - [Faker::Pokemon](doc/pokemon.md)
  - [Faker::RickAndMorty](doc/rick_and_morty.md)
  - [Faker::Robin](doc/robin.md)
  - [Faker::RockBand](doc/rock_band.md)
  - [Faker::RuPaul](doc/rupaul.md)
  - [Faker::Seinfeld](doc/seinfeld.md)
  - [Faker::Simpsons](doc/simpsons.md)
  - [Faker::SlackEmoji](doc/slack_emoji.md)
  - [Faker::Space](doc/space.md)
  - [Faker::StarTrek](doc/star_trek.md)
  - [Faker::StarWars](doc/star_wars.md)
  - [Faker::Superhero](doc/superhero.md)
  - [Faker::Team](doc/team.md)
  - [Faker::TheFreshPrinceOfBelAir](doc/the_fresh_prince_of_bel_air.md)
  - [Faker::Time](doc/time.md)
  - [Faker::TwinPeaks](doc/twin_peaks.md)
  - [Faker::Twitter](doc/twitter.md)
  - [Faker::UmphreysMcgee](doc/umphreys_mcgee.md)
  - [Faker::University](doc/university.md)
  - [Faker::Vehicle](doc/vehicle.md)
  - [Faker::VentureBros](doc/venture_bros.md)
  - [Faker::Witcher](doc/witcher.md)
  - [Faker::WorldOfWarcraft](doc/world_of_warcraft.md)
  - [Faker::Zelda](doc/zelda.md)
- [Customization](#customization)
- [Contributing](#contributing)
- [Contact](#contact)
- [License](#license)

## Installing

```bash
gem install faker
```

## Usage

```ruby
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
It is also possible to add a random number to the end of faker data to increase the
likelihood of unique data being generated. For example:

```ruby
Faker::Name.unique + ((1..1000).to_a).sample
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
