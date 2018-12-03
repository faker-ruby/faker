
![logotype a happy-07](https://user-images.githubusercontent.com/36028424/40263395-4318481e-5b44-11e8-92e5-3dcc1ce169b3.png)

# Faker
[![Build Status](https://travis-ci.org/stympy/faker.svg?branch=master)](https://travis-ci.org/stympy/faker)
[![Gem Version](https://badge.fury.io/rb/faker.svg)](https://badge.fury.io/rb/faker)
[![Inline docs](http://inch-ci.org/github/stympy/faker.svg?branch=master)](http://inch-ci.org/github/stympy/faker)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ef54c7f9df86e965d64b/test_coverage)](https://codeclimate.com/github/stympy/faker/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/ef54c7f9df86e965d64b/maintainability)](https://codeclimate.com/github/stympy/faker/maintainability)

This gem is a port of [Perl's Data::Faker library](https://metacpan.org/pod/Data::Faker) that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

- [Installing](#installing)
- [Usage](#usage)
    - [Ensuring unique values](#ensuring-unique-values)
    - [Deterministic Random](#deterministic-random)
- [Generators](#generators)
    - [Default](#default)
    - [Blockchain](#blockchain)
    - [Creature](#creature)
    - [Games](#games)
    - [Japanese Media](#japanese-media)
    - [Movies](#movies)
    - [Music](#music)
- [Customization](#customization)
- [Contributing](#contributing)
- [Contact](#contact)
- [License](#license)

### NOTE
* While Faker generates data at random, returned values are not guaranteed to be unique by default.
  You must explicity specify when you require unique values, see [details](#ensuring-unique-values).
  Values also can be deterministic if you use the deterministic feature, see [details](#deterministic-random)
* This is the `master` branch of Faker and may contain changes that are not yet released.
  Please refer the README of your version for the available methods.
  List of all versions is [available here](https://github.com/stympy/faker/releases).

## Installing
```bash
gem install faker
```
Note: if you are getting a `uninitialized constant Faker::[some_class]` error, your version of the gem is behind the one documented here. To make sure that your gem is the one documented here, change the line in your gemfile to:

```ruby
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
```

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

## Generators
**NOTE: Some of the generators below aren't released yet. If you want to use them, change the line in your gemfile to:**

```ruby
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
```

### Default
  - [Faker::Address](doc/unreleased/default/address.md)
  - [Faker::Alphanumeric](doc/unreleased/default/alphanumeric.md)
  - [Faker::Ancient](doc/unreleased/default/ancient.md)
  - [Faker::App](doc/unreleased/default/app.md)
  - [Faker::Appliance](doc/unreleased/default/appliance.md)
  - [Faker::Artist](doc/unreleased/default/artist.md)
  - [Faker::Avatar](doc/unreleased/default/avatar.md)
  - [Faker::Bank](doc/unreleased/default/bank.md)
  - [Faker::Beer](doc/unreleased/default/beer.md)
  - [Faker::Book](doc/unreleased/default/book.md)
  - [Faker::Boolean](doc/unreleased/default/boolean.md)
  - [Faker::BossaNova](doc/unreleased/default/bossa_nova.md)
  - [Faker::Business](doc/unreleased/default/business.md)
  - [Faker::Cannabis](doc/unreleased/default/cannabis.md)
  - [Faker::ChileRut](doc/unreleased/default/chile_rut.md)
  - [Faker::ChuckNorris](doc/unreleased/default/chuck_norris.md)
  - [Faker::Code](doc/unreleased/default/code.md)
  - [Faker::Coffee](doc/unreleased/default/coffee.md)
  - [Faker::Coin](doc/unreleased/default/coin.md)
  - [Faker::Color](doc/unreleased/default/color.md)
  - [Faker::Commerce](doc/unreleased/default/commerce.md)
  - [Faker::Company](doc/unreleased/default/company.md)
  - [Faker::Compass](doc/unreleased/default/compass.md)
  - [Faker::Construction](doc/unreleased/default/construction.md)
  - [Faker::Cosmere](doc/unreleased/default/cosmere.md)
  - [Faker::Crypto](doc/unreleased/default/crypto.md)
  - [Faker::CryptoCoin](doc/unreleased/default/crypto_coin.md)
  - [Faker::Currency](doc/unreleased/default/currency.md)
  - [Faker::Date](doc/unreleased/default/date.md)
  - [Faker::DcComics](doc/unreleased/default/dc_comics.md)
  - [Faker::Demographic](doc/unreleased/default/demographic.md)
  - [Faker::Dessert](doc/unreleased/default/dessert.md)
  - [Faker::Device](doc/unreleased/default/device.md)
  - [Faker::DrivingLicence](doc/unreleased/default/driving_licence.md)
  - [Faker::Dune](doc/unreleased/default/dune.md)
  - [Faker::Educator](doc/unreleased/default/educator.md)
  - [Faker::ElectricalComponents](doc/unreleased/default/electrical_components.md)
  - [Faker::Esport](doc/unreleased/default/esport.md)
  - [Faker::FamousLastWords](doc/unreleased/default/famous_last_words.md)
  - [Faker::File](doc/unreleased/default/file.md)
  - [Faker::Fillmurray](doc/unreleased/default/fillmurray.md)
  - [Faker::Finance](doc/unreleased/default/finance.md)
  - [Faker::Food](doc/unreleased/default/food.md)
  - [Faker::Football](doc/unreleased/default/football.md)
  - [Faker::FunnyName](doc/unreleased/default/funny_name.md)
  - [Faker::Gender](doc/unreleased/default/gender.md)
  - [Faker::GreekPhilosophers](doc/unreleased/default/greek_philosophers.md)
  - [Faker::Hacker](doc/unreleased/default/hacker.md)
  - [Faker::Hipster](doc/unreleased/default/hipster.md)
  - [Faker::House](doc/unreleased/default/house.md)
  - [Faker::IDNumber](doc/unreleased/default/id_number.md)
  - [Faker::IndustrySegments](doc/unreleased/default/industry_segments.md)
  - [Faker::Internet](doc/unreleased/default/internet.md)
  - [Faker::Invoice](doc/unreleased/default/invoice.md)
  - [Faker::Job](doc/unreleased/default/job.md)
  - [Faker::Json](doc/unreleased/default/json.md)
  - [Faker::Kpop](doc/unreleased/default/kpop.md)
  - [Faker::Lorem](doc/unreleased/default/lorem.md)
  - [Faker::LoremFlickr](doc/unreleased/default/lorem_flickr.md)
  - [Faker::LoremPixel](doc/unreleased/default/lorem_pixel.md)
  - [Faker::Lovecraft](doc/unreleased/default/lovecraft.md)
  - [Faker::Markdown](doc/unreleased/default/markdown.md)
  - [Faker::Marketing](doc/unreleased/default/marketing.md)
  - [Faker::Matz](doc/unreleased/default/matz.md)
  - [Faker::Measurement](doc/unreleased/default/measurement.md)
  - [Faker::Military](doc/unreleased/default/military.md)
  - [Faker::MostInterestingManInTheWorld](doc/unreleased/default/most_interesting_man_in_the_world.md)
  - [Faker::Name](doc/unreleased/default/name.md)
  - [Faker::Nation](doc/unreleased/default/nation.md)
  - [Faker::NatoPhoneticAlphabet](doc/unreleased/default/nato_phonetic_alphabet.md)
  - [Faker::NationalHealthService](doc/unreleased/default/national_health_service.md)
  - [Faker::Number](doc/unreleased/default/number.md)
  - [Faker::Omniauth](doc/unreleased/default/omniauth.md)
  - [Faker::PhoneNumber](doc/unreleased/default/phone_number.md)
  - [Faker::Placeholdit](doc/unreleased/default/placeholdit.md)
  - [Faker::ProgrammingLanguage](doc/unreleased/default/programming_language.md)
  - [Faker::Relationship](doc/unreleased/default/relationship.md)
  - [Faker::Restaurant](doc/unreleased/default/restaurant.md)
  - [Faker::Robin](doc/unreleased/default/robin.md)
  - [Faker::Science](doc/unreleased/default/science.md)
  - [Faker::SingularSiegler](doc/unreleased/default/singular_siegler.md)
  - [Faker::SlackEmoji](doc/unreleased/default/slack_emoji.md)
  - [Faker::Source](doc/unreleased/default/source.md)
  - [Faker::SouthAfrica](doc/unreleased/default/south_africa.md)
  - [Faker::Space](doc/unreleased/default/space.md)
  - [Faker::String](doc/unreleased/default/string.md)
  - [Faker::Stripe](doc/unreleased/default/stripe.md)
  - [Faker::Subscription](doc/unreleased/default/subscription.md)
  - [Faker::Superhero](doc/unreleased/default/superhero.md)
  - [Faker::Team](doc/unreleased/default/team.md)
  - [Faker::Time](doc/unreleased/default/time.md)
  - [Faker::Twitter](doc/unreleased/default/twitter.md)
  - [Faker::Types](doc/unreleased/default/types.md)
  - [Faker::University](doc/unreleased/default/university.md)
  - [Faker::Vehicle](doc/unreleased/default/vehicle.md)
  - [Faker::Verbs](doc/unreleased/default/verbs.md)
  - [Faker::WorldCup](doc/unreleased/default/world_cup.md)

### Blockchain
  - [Faker::Blockchain::Bitcoin](doc/unreleased/blockchain/bitcoin.md)
  - [Faker::Blockchain::Ethereum](doc/unreleased/blockchain/ethereum.md)
  - [Faker::Blockchain::Tezos](doc/unreleased/blockchain/tezos.md)

### Creature
  - [Faker::Creature::Animal](doc/unreleased/creature/animal.md)
  - [Faker::Creature::Cat](doc/unreleased/creature/cat.md)
  - [Faker::Creature::Dog](doc/unreleased/creature/dog.md)

### Games
  - [Faker::Games::Dota](doc/unreleased/games/dota.md)
  - [Faker::Games::ElderScrolls](doc/unreleased/games/elder_scrolls.md)
  - [Faker::Games::Fallout](doc/unreleased/games/fallout.md)
  - [Faker::Games::HalfLife](doc/unreleased/games/half_life.md)
  - [Faker::Games::Heroes](doc/unreleased/games/heroes.md)
  - [Faker::Games::HeroesOfTheStorm](doc/unreleased/games/heroes_of_the_storm.md)
  - [Faker::Games::LeagueOfLegends](doc/unreleased/games/league_of_legends.md)
  - [Faker::Games::Myst](doc/unreleased/games/myst.md)
  - [Faker::Games::Overwatch](doc/unreleased/games/overwatch.md)
  - [Faker::Games::Pokemon](doc/unreleased/games/pokemon.md)
  - [Faker::Games::SonicTheHedgehog](doc/unreleased/games/sonic_the_hedgehog.md)
  - [Faker::Games::SuperSmashBros](doc/unreleased/games/super_smash_bros.md)
  - [Faker::Games::Witcher](doc/unreleased/games/witcher.md)
  - [Faker::Games::WorldOfWarcraft](doc/unreleased/games/world_of_warcraft.md)
  - [Faker::Games::Zelda](doc/unreleased/games/zelda.md)

### Japanese Media
  - [Faker::JapaneseMedia::DragonBall](doc/unreleased/japanese_media/dragon_ball.md)
  - [Faker::JapaneseMedia::OnePiece](doc/unreleased/japanese_media/one_piece.md)
  - [Faker::JapaneseMedia::SwordArtOnline](doc/unreleased/japanese_media/sword_art_online.md)

### Movies
  - [Faker::Movie](doc/unreleased/movies/movie.md)
  - [Faker::Movies::BackToTheFuture](doc/unreleased/movies/back_to_the_future.md)
  - [Faker::Movies::Ghostbusters](doc/unreleased/movies/ghostbusters.md)
  - [Faker::Movies::GratefulDead](doc/unreleased/movies/grateful_dead.md)
  - [Faker::Movies::HarryPotter](doc/unreleased/movies/harry_potter.md)
  - [Faker::Movies::HitchhikersGuideToTheGalaxy](doc/unreleased/movies/hitchhikers_guide_to_the_galaxy.md)
  - [Faker::Movies::Hobbit](doc/unreleased/movies/hobbit.md)
  - [Faker::Movies::Lebowski](doc/unreleased/movies/lebowski.md)
  - [Faker::Movies::LordOfTheRings](doc/unreleased/movies/lord_of_the_rings.md)
  - [Faker::Movies::PrincessBride](doc/unreleased/movies/princess_bride.md)
  - [Faker::Movies::StarWars](doc/unreleased/movies/star_wars.md)
  - [Faker::Movies::VForVendetta](doc/unreleased/movies/v_for_vendetta.md)

### Music
  - [Faker::Music](doc/unreleased/music/music.md)
  - [Faker::Music::Phish](doc/unreleased/music/phish.md)
  - [Faker::Music::RockBand](doc/unreleased/music/rock_band.md)
  - [Faker::Music::UmphreysMcgee](doc/unreleased/music/umphreys_mcgee.md)

### Tv Shows
  - [Faker::TvShows::AquaTeenHungerForce](doc/unreleased/tv_shows/aqua_teen_hunger_force.md)
  - [Faker::TvShows::BojackHorseman](doc/unreleased/tv_shows/bojack_horseman.md)
  - [Faker::TvShows::BreakingBad](doc/unreleased/tv_shows/breaking_bad.md)
  - [Faker::TvShows::Buffy](doc/unreleased/tv_shows/buffy.md)
  - [Faker::TvShows::Community](doc/unreleased/tv_shows/community.md)
  - [Faker::TvShows::DrWho](doc/unreleased/tv_shows/dr_who.md)
  - [Faker::TvShows::DumbAndDumber](doc/unreleased/tv_shows/dumb_and_dumber.md)
  - [Faker::TvShows::FamilyGuy](doc/unreleased/tv_shows/family_guy.md)
  - [Faker::TvShows::Friends](doc/unreleased/tv_shows/friends.md)
  - [Faker::TvShows::GameOfThrones](doc/unreleased/tv_shows/game_of_thrones.md)
  - [Faker::TvShows::HeyArnold](doc/unreleased/tv_shows/hey_arnold.md)
  - [Faker::TvShows::HowIMetYourMother](doc/unreleased/tv_shows/how_i_met_your_mother.md)
  - [Faker::TvShows::MichaelScott](doc/unreleased/tv_shows/michael_scott.md)
  - [Faker::TvShows::NewGirl](doc/unreleased/tv_shows/new_girl.md)
  - [Faker::TvShows::ParksAndRec](doc/unreleased/tv_shows/parks_and_rec.md)
  - [Faker::TvShows::RickAndMorty](doc/unreleased/tv_shows/rick_and_morty.md)
  - [Faker::TvShows::RuPaul](doc/unreleased/tv_shows/rupaul.md)
  - [Faker::TvShows::Seinfeld](doc/unreleased/tv_shows/seinfeld.md)
  - [Faker::TvShows::SiliconValley](doc/unreleased/tv_shows/silicon_valley.md)
  - [Faker::TvShows::Simpsons](doc/unreleased/tv_shows/simpsons.md)
  - [Faker::TvShows::SouthPark](doc/unreleased/tv_shows/south_park.md)
  - [Faker::TvShows::StarTrek](doc/unreleased/tv_shows/star_trek.md)
  - [Faker::TvShows::Stargate](doc/unreleased/tv_shows/stargate.md)
  - [Faker::TvShows::StrangerThings](doc/unreleased/tv_shows/stranger_things.md)
  - [Faker::TvShows::TheExpanse](doc/unreleased/tv_shows/the_expanse.md)
  - [Faker::TvShows::TheFreshPrinceOfBelAir](doc/unreleased/tv_shows/the_fresh_prince_of_bel_air.md)
  - [Faker::TvShows::TheITCrowd](doc/unreleased/tv_shows/the_it_crowd.md)
  - [Faker::TvShows::TheThickOfIt](doc/unreleased/tv_shows/the_thick_of_it.md)
  - [Faker::TvShows::TwinPeaks](doc/unreleased/tv_shows/twin_peaks.md)
  - [Faker::TvShows::VentureBros](doc/unreleased/tv_shows/venture_bros.md)

## Customization
Since you may want to make addresses and other types of data look different
depending on where in the world you are (US postal codes vs. UK postal codes,
for example), Faker uses the I18n gem to store strings (like state names) and
formats (US postal codes are NNNNN while UK postal codes are AAN NAA),
allowing you to get different formats by switching locales.  Just set
Faker::Config.locale to the locale you want, and Faker will take care of the
rest.

If your locale doesn't already exist, create it in the `lib/locales` directory
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
