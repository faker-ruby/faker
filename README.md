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
  - [Faker::Business](doc/business.md)
  - [Faker::Cat](doc/cat.md)
  - [Faker::ChuckNorris](doc/chuck_norris.md)
  - [Faker::Code](doc/code.md)
  - [Faker::Color](doc/color.md)
  - [Faker::Commerce](doc/commerce.md)
  - [Faker::Company](doc/company.md)
  - [Faker::Crypto](doc/crypto.md)
  - [Faker::Date](doc/date.md)
  - [Faker::Demographic](doc/demographic.md)
  - [Faker::Educator](doc/educator.md)
  - [Faker::File](doc/file.md)
  - [Faker::Fillmurray](doc/fillmurray.md)
  - [Faker::Food](doc/food.md)
  - [Faker::Friends](doc/friends.md)
  - [Faker::GameOfThrones](doc/game_of_thrones.md)
  - [Faker::Hacker](doc/hacker.md)
  - [Faker::HarryPotter](doc/harry_potter.md)
  - [Faker::Hipster](doc/hipster.md)
  - [Faker::Internet](doc/internet.md)
  - [Faker::LordOfTheRings](doc/lord_of_the_rings.md)
  - [Faker::LoremPixel](doc/lorem_pixel.md)
  - [Faker::Lorem](doc/lorem.md)
  - [Faker::Music](doc/music.md)
  - [Faker::Name](doc/name.md)
  - [Faker::Number](doc/number.md)
  - [Faker::Omniauth](doc/omniauth.md)
  - [Faker::PhoneNumber](doc/phone_number.md)
  - [Faker::Placeholdit](doc/placeholdit.md)
  - [Faker::Pokemon](doc/pokemon.md)
  - [Faker::RockBand](doc/rock_band.md)
  - [Faker::SlackEmoji](doc/slack_emoji.md)
  - [Faker::Space](doc/space.md)
  - [Faker::StarWars](doc/star_wars.md)
  - [Faker::Superhero](doc/superhero.md)
  - [Faker::Team](doc/team.md)
  - [Faker::Time](doc/time.md)
  - [Faker::TwinPeaks](doc/twin_peaks.md)
  - [Faker::Twitter](doc/twitter.md)
  - [Faker::University](doc/university.md)
  - [Faker::Vehicle](doc/vehicle.md)
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

## Customization

Since you may want to make addresses and other types of data look different
depending on where in the world you are (US postal codes vs. UK postal codes,
for example), Faker uses the I18n gem to store strings (like state names) and
formats (US postal codes are NNNNN while UK postal codes are AAN NAA),
allowing you to get different formats by switching locales.  Just set
Faker::Config.locale to the locale you want, and Faker will take care of the
rest.

If your locale doesn't already exist, create it in the \lib\locales\ directory
and you can then override or add elements to suit

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
