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
    - [Books](#books)
    - [Creature](#creature)
    - [Games](#games)
    - [Japanese Media](#japanese-media)
    - [Movies](#movies)
    - [Music](#music)
    - [Quotes](#quotes)
    - [TV Shows](#tv-shows)
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
  - [Faker::Address](doc/default/address.md)
  - [Faker::Alphanumeric](doc/default/alphanumeric.md)
  - [Faker::Ancient](doc/default/ancient.md)
  - [Faker::App](doc/default/app.md)
  - [Faker::Appliance](doc/default/appliance.md)
  - [Faker::Artist](doc/default/artist.md)
  - [Faker::Avatar](doc/default/avatar.md)
  - [Faker::Bank](doc/default/bank.md)
  - [Faker::Beer](doc/default/beer.md)
  - [Faker::Boolean](doc/default/boolean.md)
  - [Faker::BossaNova](doc/default/bossa_nova.md)
  - [Faker::Business](doc/default/business.md)
  - [Faker::Cannabis](doc/default/cannabis.md)
  - [Faker::ChileRut](doc/default/chile_rut.md)
  - [Faker::ChuckNorris](doc/default/chuck_norris.md)
  - [Faker::Code](doc/default/code.md)
  - [Faker::Coffee](doc/default/coffee.md)
  - [Faker::Coin](doc/default/coin.md)
  - [Faker::Color](doc/default/color.md)
  - [Faker::Commerce](doc/default/commerce.md)
  - [Faker::Company](doc/default/company.md)
  - [Faker::Compass](doc/default/compass.md)
  - [Faker::Construction](doc/default/construction.md)
  - [Faker::Cosmere](doc/default/cosmere.md)
  - [Faker::Crypto](doc/default/crypto.md)
  - [Faker::CryptoCoin](doc/default/crypto_coin.md)
  - [Faker::Currency](doc/default/currency.md)
  - [Faker::Date](doc/default/date.md)
  - [Faker::DcComics](doc/default/dc_comics.md)
  - [Faker::Demographic](doc/default/demographic.md)
  - [Faker::Dessert](doc/default/dessert.md)
  - [Faker::Device](doc/default/device.md)
  - [Faker::DrivingLicence](doc/default/driving_licence.md)
  - [Faker::Educator](doc/default/educator.md)
  - [Faker::ElectricalComponents](doc/default/electrical_components.md)
  - [Faker::Esport](doc/default/esport.md)
  - [Faker::File](doc/default/file.md)
  - [Faker::Fillmurray](doc/default/fillmurray.md)
  - [Faker::Finance](doc/default/finance.md)
  - [Faker::Food](doc/default/food.md)
  - [Faker::Football](doc/default/football.md)
  - [Faker::FunnyName](doc/default/funny_name.md)
  - [Faker::Gender](doc/default/gender.md)
  - [Faker::GreekPhilosophers](doc/default/greek_philosophers.md)
  - [Faker::Hacker](doc/default/hacker.md)
  - [Faker::Hipster](doc/default/hipster.md)
  - [Faker::House](doc/default/house.md)
  - [Faker::IDNumber](doc/default/id_number.md)
  - [Faker::IndustrySegments](doc/default/industry_segments.md)
  - [Faker::Internet](doc/default/internet.md)
  - [Faker::Invoice](doc/default/invoice.md)
  - [Faker::Job](doc/default/job.md)
  - [Faker::Json](doc/default/json.md)
  - [Faker::Kpop](doc/default/kpop.md)
  - [Faker::Lorem](doc/default/lorem.md)
  - [Faker::LoremFlickr](doc/default/lorem_flickr.md)
  - [Faker::LoremPixel](doc/default/lorem_pixel.md)
  - [Faker::Markdown](doc/default/markdown.md)
  - [Faker::Marketing](doc/default/marketing.md)
  - [Faker::Measurement](doc/default/measurement.md)
  - [Faker::Military](doc/default/military.md)
  - [Faker::Name](doc/default/name.md)
  - [Faker::Nation](doc/default/nation.md)
  - [Faker::NatoPhoneticAlphabet](doc/default/nato_phonetic_alphabet.md)
  - [Faker::NationalHealthService](doc/default/national_health_service.md)
  - [Faker::Number](doc/default/number.md)
  - [Faker::Omniauth](doc/default/omniauth.md)
  - [Faker::PhoneNumber](doc/default/phone_number.md)
  - [Faker::Placeholdit](doc/default/placeholdit.md)
  - [Faker::ProgrammingLanguage](doc/default/programming_language.md)
  - [Faker::Relationship](doc/default/relationship.md)
  - [Faker::Restaurant](doc/default/restaurant.md)
  - [Faker::Science](doc/default/science.md)
  - [Faker::SlackEmoji](doc/default/slack_emoji.md)
  - [Faker::Source](doc/default/source.md)
  - [Faker::SouthAfrica](doc/default/south_africa.md)
  - [Faker::Space](doc/default/space.md)
  - [Faker::String](doc/default/string.md)
  - [Faker::Stripe](doc/default/stripe.md)
  - [Faker::Subscription](doc/default/subscription.md)
  - [Faker::Superhero](doc/default/superhero.md)
  - [Faker::Team](doc/default/team.md)
  - [Faker::Time](doc/default/time.md)
  - [Faker::Twitter](doc/default/twitter.md)
  - [Faker::Types](doc/default/types.md)
  - [Faker::University](doc/default/university.md)
  - [Faker::Vehicle](doc/default/vehicle.md)
  - [Faker::Verbs](doc/default/verbs.md)
  - [Faker::WorldCup](doc/default/world_cup.md)

### Blockchain
  - [Faker::Blockchain::Bitcoin](doc/blockchain/bitcoin.md)
  - [Faker::Blockchain::Ethereum](doc/blockchain/ethereum.md)
  - [Faker::Blockchain::Tezos](doc/blockchain/tezos.md)

### Books
  - [Faker::Book](doc/books/book.md)
  - [Faker::Books::CultureSeries](doc/books/culture_series.md)
  - [Faker::Books::Dune](doc/books/dune.md)
  - [Faker::Books::Lovecraft](doc/books/lovecraft.md)

### Creature
  - [Faker::Creature::Animal](doc/creature/animal.md)
  - [Faker::Creature::Cat](doc/creature/cat.md)
  - [Faker::Creature::Dog](doc/creature/dog.md)

### Games
  - [Faker::Games::Dota](doc/games/dota.md)
  - [Faker::Games::ElderScrolls](doc/games/elder_scrolls.md)
  - [Faker::Games::Fallout](doc/games/fallout.md)
  - [Faker::Games::HalfLife](doc/games/half_life.md)
  - [Faker::Games::Heroes](doc/games/heroes.md)
  - [Faker::Games::HeroesOfTheStorm](doc/games/heroes_of_the_storm.md)
  - [Faker::Games::LeagueOfLegends](doc/games/league_of_legends.md)
  - [Faker::Games::Myst](doc/games/myst.md)
  - [Faker::Games::Overwatch](doc/games/overwatch.md)
  - [Faker::Games::Pokemon](doc/games/pokemon.md)
  - [Faker::Games::SonicTheHedgehog](doc/games/sonic_the_hedgehog.md)
  - [Faker::Games::SuperSmashBros](doc/games/super_smash_bros.md)
  - [Faker::Games::Witcher](doc/games/witcher.md)
  - [Faker::Games::WorldOfWarcraft](doc/games/world_of_warcraft.md)
  - [Faker::Games::Zelda](doc/games/zelda.md)

### Japanese Media
  - [Faker::JapaneseMedia::DragonBall](doc/japanese_media/dragon_ball.md)
  - [Faker::JapaneseMedia::OnePiece](doc/japanese_media/one_piece.md)
  - [Faker::JapaneseMedia::SwordArtOnline](doc/japanese_media/sword_art_online.md)

### Movies
  - [Faker::Movie](doc/movies/movie.md)
  - [Faker::Movies::BackToTheFuture](doc/movies/back_to_the_future.md)
  - [Faker::Movies::Ghostbusters](doc/movies/ghostbusters.md)
  - [Faker::Movies::GratefulDead](doc/movies/grateful_dead.md)
  - [Faker::Movies::HarryPotter](doc/movies/harry_potter.md)
  - [Faker::Movies::HitchhikersGuideToTheGalaxy](doc/movies/hitchhikers_guide_to_the_galaxy.md)
  - [Faker::Movies::Hobbit](doc/movies/hobbit.md)
  - [Faker::Movies::Lebowski](doc/movies/lebowski.md)
  - [Faker::Movies::LordOfTheRings](doc/movies/lord_of_the_rings.md)
  - [Faker::Movies::PrincessBride](doc/movies/princess_bride.md)
  - [Faker::Movies::StarWars](doc/movies/star_wars.md)
  - [Faker::Movies::VForVendetta](doc/movies/v_for_vendetta.md)

### Music
  - [Faker::Music](doc/music/music.md)
  - [Faker::Music::Phish](doc/music/phish.md)
  - [Faker::Music::RockBand](doc/music/rock_band.md)
  - [Faker::Music::UmphreysMcgee](doc/music/umphreys_mcgee.md)

### Quotes
  - [Faker::Quote](doc/quotes/quote.md)
  - [Faker::Quotes::Shakespeare](doc/quotes/shakespeare.md)

### Tv Shows
  - [Faker::TvShows::AquaTeenHungerForce](doc/tv_shows/aqua_teen_hunger_force.md)
  - [Faker::TvShows::BojackHorseman](doc/tv_shows/bojack_horseman.md)
  - [Faker::TvShows::BreakingBad](doc/tv_shows/breaking_bad.md)
  - [Faker::TvShows::Buffy](doc/tv_shows/buffy.md)
  - [Faker::TvShows::Community](doc/tv_shows/community.md)
  - [Faker::TvShows::DrWho](doc/tv_shows/dr_who.md)
  - [Faker::TvShows::DumbAndDumber](doc/tv_shows/dumb_and_dumber.md)
  - [Faker::TvShows::FamilyGuy](doc/tv_shows/family_guy.md)
  - [Faker::TvShows::Friends](doc/tv_shows/friends.md)
  - [Faker::TvShows::GameOfThrones](doc/tv_shows/game_of_thrones.md)
  - [Faker::TvShows::HeyArnold](doc/tv_shows/hey_arnold.md)
  - [Faker::TvShows::HowIMetYourMother](doc/tv_shows/how_i_met_your_mother.md)
  - [Faker::TvShows::MichaelScott](doc/tv_shows/michael_scott.md)
  - [Faker::TvShows::NewGirl](doc/tv_shows/new_girl.md)
  - [Faker::TvShows::ParksAndRec](doc/tv_shows/parks_and_rec.md)
  - [Faker::TvShows::RickAndMorty](doc/tv_shows/rick_and_morty.md)
  - [Faker::TvShows::RuPaul](doc/tv_shows/rupaul.md)
  - [Faker::TvShows::Seinfeld](doc/tv_shows/seinfeld.md)
  - [Faker::TvShows::SiliconValley](doc/tv_shows/silicon_valley.md)
  - [Faker::TvShows::Simpsons](doc/tv_shows/simpsons.md)
  - [Faker::TvShows::SouthPark](doc/tv_shows/south_park.md)
  - [Faker::TvShows::StarTrek](doc/tv_shows/star_trek.md)
  - [Faker::TvShows::Stargate](doc/tv_shows/stargate.md)
  - [Faker::TvShows::StrangerThings](doc/tv_shows/stranger_things.md)
  - [Faker::TvShows::TheExpanse](doc/tv_shows/the_expanse.md)
  - [Faker::TvShows::TheFreshPrinceOfBelAir](doc/tv_shows/the_fresh_prince_of_bel_air.md)
  - [Faker::TvShows::TheITCrowd](doc/tv_shows/the_it_crowd.md)
  - [Faker::TvShows::TheThickOfIt](doc/tv_shows/the_thick_of_it.md)
  - [Faker::TvShows::TwinPeaks](doc/tv_shows/twin_peaks.md)
  - [Faker::TvShows::VentureBros](doc/tv_shows/venture_bros.md)

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
      first_name:
        - Charlotte
        - Ava
        - Chloe
        - Emily

      # New faker fields
      ocker_first_name:
        - Bazza
        - Bluey
        - Davo
        - Johno
        - Shano
        - Shazza
      region:
        - South East Queensland
        - Wide Bay Burnett
        - Margaret River
        - Port Pirie
        - Gippsland
        - Elizabeth
        - Barossa
```

## Contributing
See [CONTRIBUTING.md](https://github.com/stympy/faker/blob/master/CONTRIBUTING.md).

## Contact
Comments and feedback are welcome. Send an email to Benjamin Curtis via the [google group](http://groups.google.com/group/ruby-faker).

## License
This code is free to use under the terms of the MIT license.
