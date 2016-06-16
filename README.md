# Faker [![Build Status](https://travis-ci.org/stympy/faker.svg?branch=master)](https://travis-ci.org/stympy/faker) [![Gem Version](https://badge.fury.io/rb/faker.svg)](https://badge.fury.io/rb/faker)


This gem is a port of Perl's Data::Faker library that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

### NOTE

* While Faker generates data at random, returned values are not guaranteed to be unique.
* This is the `master` branch of Faker and may contain changes that are not yet released.
  Please refer to the README of your version for the available methods.
  List of all versions is [available here](https://github.com/stympy/faker/releases).

Contents
--------

- [Installing](#installing)
- [Usage](#usage)
  - [Faker::Address](#fakeraddress)
  - [Faker::Bitcoin](#fakerbitcoin)
  - [Faker::Business](#fakerbusiness)
  - [Faker::Code](#fakercode)
  - [Faker::Color](#fakercolor)
  - [Faker::Commerce](#fakercommerce)
  - [Faker::Company](#fakercompany)
  - [Faker::Date](#fakerdate)
  - [Faker::Internet](#fakerinternet)
  - [Faker::File](#fakerfile)
  - [Faker::Lorem](#fakerlorem)
  - [Faker::Name](#fakername)
  - [Faker::Number](#fakernumber)
  - [Faker::Boolean](#fakerboolean)
  - [Faker::PhoneNumber](#fakerphonenumber)
  - [Faker::Time](#fakertime)
  - [Faker::Hacker](#fakerhacker)
  - [Faker::Crypto](#fakercrypto)
  - [Faker::App](#fakerapp)
  - [Faker::SlackEmoji](#fakerslackemoji)
  - [Faker::Team](#fakerteam)
  - [Faker::Book](#fakerbook)
  - [Faker::University](#fakeruniversity)
  - [Faker::Placeholdit](#fakerplaceholdit)
  - [Faker::Hipster](#fakerhipster)
  - [Faker::Superhero](#fakersuperhero)
  - [Faker::StarWars](#fakerstarwars)
  - [Faker::Beer](#fakerbeer)
  - [Faker::ChuckNorris](#fakerchucknorris)
  - [Faker::Educator](#fakereducator)
  - [Faker::Space](#fakerspace)
  - [Faker::Music](#fakermusic)
  - [Faker::Vehicle](#fakervehicle)
- [Customization](#customization)
- [Contributing](#contributing)
- [Contact](#contact)
- [License](#license)

Installing
----------
```bash
gem install faker
```

##Usage
-----
```ruby
Faker::Name.name      #=> "Christophe Bartell"

Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
```

### Faker::Address
-----------------

```ruby
Faker::Address.city #=> "Imogeneborough"

Faker::Address.street_name #=> "Larkin Fork"

Faker::Address.street_address #=> "282 Kevin Brook"

Faker::Address.secondary_address #=> "Apt. 672"

Faker::Address.building_number #=> "7304"

Faker::Address.zip_code #=> "58517"

Faker::Address.zip #=> "58517"

Faker::Address.postcode #=> "58517"

Faker::Address.time_zone #=> "Asia/Yakutsk"

Faker::Address.street_suffix #=> "Street"

Faker::Address.city_suffix #=> "fort"

Faker::Address.city_prefix #=> "Lake"

Faker::Address.state #=> "California"

Faker::Address.state_abbr #=> "AP"

Faker::Address.country #=> "French Guiana"

Faker::Address.country_code #=> "IT"

Faker::Address.latitude #=> "-58.17256227443719"

Faker::Address.longitude #=> "-156.65548382095133"


```

###Faker::Bitcoin
-----------------

```ruby

Faker::Bitcoin.address #=> "1HUoGjmgChmnxxYhz87YytV4gVjfPaExmh"
Faker::Bitcoin.testnet_address #=> "msHGunDvoEwmVFXvd2Bub1SNw5RP1YHJaf"

```

###Faker::Business
------------------

```ruby

Faker::Business.credit_card_number #=> "1228-1221-1221-1431"

Faker::Business.credit_card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>

Faker::Business.credit_card_type #=> "visa"

```

###Faker::Code
--------------

```ruby

Faker::Code.isbn #=> "759021701-8"

Faker::Code.ean #=> "4600051000057"

Faker::Code.imei #= "546327785982623"

Faker::Code.asin #=> "B00000IGGJ"

```

###Faker::Color
---------------

```ruby

Faker::Color.hex_color #=> "#31a785"

Faker::Color.color_name #=> "yellow"

Faker::Color.rgb_color #=> [54, 233, 67]

Faker::Color.hsl_color #=> [69.87, 169.66, 225.3]

Faker::Color.hsla_color #=> [154.77, 232.36, 58.9, 0.26170574657729073]

```

###Faker::Commerce
------------------

```ruby

Faker::Commerce.color #=> "lavender"

# Optional arguments max: 3, fixed_amount: false
Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.department(max: 5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(max: 2, fixed_amount: true) #=> "Books & Tools"

Faker::Commerce.product_name #=> "Practical Granite Shirt"

Faker::Commerce.price #=> "44.6"

```

###Faker::Company
-----------------

```ruby

Faker::Company.name #=> "Hirthe-Ritchie"

Faker::Company.suffix #=> "Group"

# Generate a buzzword-laden catch phrase.
Faker::Company.catch_phrase #=> "Business-focused coherent parallelism"

Faker::Company.buzzword #=> "Business-focused"

# When a straight answer won't do, BS to the rescue!
Faker::Company.bs #=> "empower one-to-one web-readiness"

Faker::Company.ein #=> "34-8488813"

Faker::Company.duns_number #=> "08-341-3736"

# Get a random company logo url in PNG format.
Faker::Company.logo #=> "https://pigment.github.com/fake-logos/logos/medium/color/5.png"

Faker::Company.swedish_organisation_number #=> "7718797652"

# Generate an Australian Business Number
Faker::Company.australian_business_number #=> "81137773602"

# Get a random profession
Faker::Company.profession #=> "firefighter"

```

###Faker::Date
---------------------

```ruby
# Random date between dates
Faker::Date.between(from: 2.days.ago, to: Date.today) #=> "Wed, 24 Sep 2014"

# Random date between dates except for certain date
Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, except: Date.today) #=> "Wed, 24 Sep 2014"

# Random date in the future (up to maximum of N days)
Faker::Date.forward(days: 23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
Faker::Date.backward(days: 14) #=> "Fri, 19 Sep 2014"
```

###Faker::Internet
---------------

```ruby
# Optional argument name: nil
Faker::Internet.email #=> "eliza@mann.net"

Faker::Internet.email(name: 'Nancy') #=> "nancy@terry.biz"

# Optional argument name: nil
Faker::Internet.free_email #=> "freddy@gmail.com"

Faker::Internet.free_email(name: 'Nancy') #=> "nancy@yahoo.com"

# Optional argument name: nil
Faker::Internet.safe_email #=> "christelle@example.org"

Faker::Internet.safe_email(name: 'Nancy') #=> "nancy@example.net"

# Optional arguments specifier: nil, separators: %w(. _)
Faker::Internet.user_name #=> "alexie"

Faker::Internet.user_name(specifier: 'Nancy') #=> "nancy"

Faker::Internet.user_name(specifier: 'Nancy Johnson', separators: %w(. _ -)) #=> "johnson-nancy"

# Optional arguments: min_length: 8, max_length: 16, mix_case: true, special_chars: false
Faker::Internet.password #=> "vg5msvy1uerg7"

Faker::Internet.password(min_length: 8) #=> "yfgjik0hgzdqs0"

Faker::Internet.password(min_length: 10, max_length: 20) #=> "eoc9shwd1hwq4vbgfw"

Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) #=> "3k5qS15aNmG"

Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_chars: true) #=> "*%NkOnJsH4"

Faker::Internet.domain_name #=> "effertz.info"

Faker::Internet.fix_umlauts('äöüß') #=> "aeoeuess"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"

Faker::Internet.ip_v4_address #=> "24.29.18.175"

# Private IP range according to RFC 1918 and 127.0.0.0/8 and 169.254.0.0/16.
Faker::Internet.private_ip_v4_address #=> "10.0.0.1"

# Guaranteed not to be in the ip range from the private_ip_v4_address method.
Faker::Internet.public_ip_v4_address #=> "24.29.18.175"

Faker::Internet.ip_v4_cidr #=> "24.29.18.175/21"

Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

Faker::Internet.ip_v6_cidr #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df/78"

# Optional argument prefix: ''
Faker::Internet.mac_address #=> "e6:0d:00:11:ed:4f"
Faker::Internet.mac_address(prefix: '55:44:33') #=> "55:44:33:02:1d:9b"

# Optional arguments: host: domain_name, path: "/#{user_name}"
Faker::Internet.url #=> "http://thiel.com/chauncey_simonis"
Faker::Internet.url(host: 'example.com') #=> "http://example.com/clotilde.swift"
Faker::Internet.url(host: 'example.com', path: '/foobar.html') #=> "http://example.com/foobar.html"

# Optional arguments: words: nil, glue: nil
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug(words: 'foo bar') #=> "foo.bar"
Faker::Internet.slug(words: 'foo bar', glue: '-') #=> "foo-bar"


```

###Faker::File
---------------
```ruby
Faker::File.extension #=> "mp3"
Faker::File.mime_type #=> "application/pdf"
# Optional arguments: dir:, name:, extension:, directory_separator:
Faker::File.file_name(dir: 'path/to') #=> "path/to/something_random.jpg"
Faker::File.file_name(dir: 'foo/bar', name: 'baz') #=> "foo/bar/baz.zip"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', extension: 'doc') #=> "foo/bar/baz.doc"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', extension: 'mp3', directory_separator: '_') #=> "foo_bar_baz.mp3"
```

###Faker::Lorem
---------------

```ruby

Faker::Lorem.word #=> "repellendus"

# Optional arguments: count: 3, supplemental: false (words from a supplementary list of Lorem-like words)
Faker::Lorem.words #=> ["dolores", "adipisci", "nesciunt"]
Faker::Lorem.words(count: 4) #=> ["culpa", "recusandae", "aut", "omnis"]
Faker::Lorem.words(count: 4, supplemental: true) #=> ["colloco", "qui", "vergo", "deporto"]

# Optional arguments: char_count=255
Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
Faker::Lorem.characters(10) #=> "ang9cbhoa8"

# Optional arguments: word_count: 4, supplemental: false, random_words_to_add: 6
Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
Faker::Lorem.sentence(word_count: 3) #=> "Commodi qui minus deserunt sed vero quia."
Faker::Lorem.sentence(word_count: 3, supplemental: true) #=> "Inflammatio denego necessitatibus caelestis autus illum."
Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) #=> "Aut voluptatem illum fugit ut sit."
Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4) #=> "Accusantium tantillus dolorem timor."

# Optional arguments: count: 3, supplemental: false
Faker::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
Faker::Lorem.sentences(count: 1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
Faker::Lorem.sentences(count: 1, supplemental: true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]

# Optional arguments: sentence_count: 3, supplemental: false, random_sentences_to_add: 3
Faker::Lorem.paragraph #=> "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
Faker::Lorem.paragraph(sentence_count: 2) #=> "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: true) #=> "Cedo vero adipisci. Theatrum crustulum coaegresco tonsor crastinus stabilis. Aliqua crur consequatur amor una tolero sum."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) #=> "Neque aut et nemo aut incidunt voluptates. Dolore cum est sint est. Vitae assumenda porro odio dolores fugiat. Est voluptatum quia rerum."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) #=> "Vomito unde uxor annus. Et patior utilis sursum."

# Optional arguments: count: 3, supplemental: false
Faker::Lorem.paragraphs #=> ["Dolores quis quia ad quo voluptates. Maxime delectus totam numquam. Necessitatibus vel atque qui dolore.", "Id neque nemo. Dolores iusto facere est ad. Accusamus ipsa dolor ut.", "Et officiis ut hic. Sunt asperiores minus distinctio debitis ipsa dolor. Minima eos deleniti."]
Faker::Lorem.paragraphs(count: 1) #=> ["Labore voluptas sequi. Ratione nulla eaque quia molestiae fugit. At quam laboriosam aut ut dignissimos."]
Faker::Lorem.paragraphs(count: 1, supplemental: true) #=> ["Depulso animi cunctatio amicitia adficio. Vester viduo qui despirmatio voluptas. Validus laudantium adopto ut agnitio venustas. Aer arcus odio esse."]

```

###Faker::Name
--------------

```ruby

Faker::Name.name             #=> "Tyshawn Johns Sr."

Faker::Name.name_with_middle #=> "Aditya Elton Douglas"

Faker::Name.first_name       #=> "Kaci"

Faker::Name.last_name        #=> "Ernser"

Faker::Name.prefix           #=> "Mr."

Faker::Name.suffix           #=> "IV"

Faker::Name.title            #=> "Legacy Creative Director"

```

###Faker::Avatar
----------------

```ruby
# Optional arguments: slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil
Faker::Avatar.image #=> "https://robohash.org/sitsequiquia.png?size=300x300"

Faker::Avatar.image(slug: "my-own-slug") #=> "https://robohash.org/my-own-slug.png?size=300x300"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") #=> "https://robohash.org/my-own-slug.jpg?size=50x50"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp") #=> "https://robohash.org/my-own-slug.bmp?size=50x50"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
```

###Faker::Number
----------------

```ruby

# Required parameter: digits:
Faker::Number.number(digits: 10) #=> "1968353479"

# Required parameter: whole_digits:
# Optional parameter: decimal_digits: 2
Faker::Number.decimal(whole_digits: 2) #=> "11.88"

Faker::Number.decimal(whole_digits: 2, decimal_digits: 3) #=> "18.843"

# Required parameter: digits
Faker::Number.hexadecimal(digits: 3) #=> "e74"

# Optional parameters: from: 1.00, to: 5000.00
Faker::Number.between(from: 1, to: 10) #=> 7

# Optional parameters: from: 1.00, to: 5000.00
Faker::Number.positive #=> 235.59238499107653

# Optional parameters: from: -5000.00, to: -1.00
Faker::Number.negative #=> -4480.042585669558

Faker::Number.digit #=> "1"

```

###Faker::Boolean
----------------

```ruby

# Optional parameter: true_ratio: 0.5
Faker::Boolean.boolean #=> true

Faker::Boolean.boolean(true_ratio: 0.2) #=> false

```

###Faker::PhoneNumber
---------------------

Phone numbers may be in any of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 1-333-333-3333
  * 333.333.3333
  * 333-333-3333
  * 333-333-3333 x3333
  * (333) 333-3333 x3333
  * 1-333-333-3333 x3333
  * 333.333.3333 x3333

(Don't let the example output below fool you - any format can be returned at random.)

```ruby

Faker::PhoneNumber.phone_number #=> "397.693.1309"

Faker::PhoneNumber.cell_phone #=> "(186)285-7925"

# NOTE NOTE NOTE NOTE
# For the 'US only' methods below, first you must do the following:
Faker::Config.locale = 'en-US'

# US only
Faker::PhoneNumber.area_code #=> "201"

# US only
Faker::PhoneNumber.exchange_code #=> "208"

# Optional parameter: length: 4
Faker::PhoneNumber.subscriber_number #=> "3873"

Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"

Faker::PhoneNumber.extension #=> "3764"

```

###Faker::Time
---------------------

```ruby

# Required parameters: from:, to:
# Optional parameter: period: :all
# Random date between dates
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
# You can install the as-duration gem to facilitate time manipulation like 45.minutes + 2.hours
# (not needed if you already have activesupport, which is included with Rails)
require 'as-duration'
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :midnight) #=> "2014-09-20 00:40:14 -0700"

# Optional parameters: days: 365, period: :all
# Random time in the future (up to maximum of N days)
Faker::Time.forward(days: 23, period: :morning) # => "2014-09-26 06:54:47 -0700"

# Optional parameters: days: 365, period: :all
# Random time in the past (up to maximum of N days)
Faker::Time.backward(days: 14, period: :evening) #=> "2014-09-17 19:56:33 -0700"
```

###Faker::Hacker
---------------------
Are you having trouble writing tech-savvy dialogue for your latest screenplay?
Worry not! Hollywood-grade technical talk is ready to fill out any form where you need to look smart.

```ruby
# Full Phrase
Faker::Hacker.say_something_smart #=> "Try to compress the SQL interface, maybe it will program the back-end hard drive!"

# Short technical abbreviations
Faker::Hacker.abbreviation  #=> "RAM"

# Hacker centric adjectives
Faker::Hacker.adjective   #=> "open-source"

# Only the best hacker related nouns
Faker::Hacker.noun   #=> "bandwidth"

# Actions that hackers take
Faker::Hacker.verb  #=> "bypass"

# Verbs that end in -ing
Faker::Hacker.ingverb #=> "synthesizing"
```

###Faker::Crypto
---------------------

```ruby

Faker::Crypto.md5 #=> "6b5ed240042e8a65c55ddb826c3408e6"

Faker::Crypto.sha1 #=> "4e99e31c51eef8b2d290e709f757f92e558a503f"

Faker::Crypto.sha256 #=> "51e4dbb424cd9db1ec5fb989514f2a35652ececef33f21c8dd1fd61bb8e3929d"

```

###Faker::App
-----------------

```ruby

Faker::App.name #=> "Treeflex"

Faker::App.version #=> "0.7.9"

Faker::App.author #=> "Daphne Swift"

```

###Faker::SlackEmoji
-----------------

```ruby

# Random Slack Emoji from people category
Faker::SlackEmoji.people #=> ":sleepy:"

# Random Slack Emoji from nature category
Faker::SlackEmoji.nature #=> ":chestnut:"

# Random Slack Emoji from food and drink category
Faker::SlackEmoji.food_and_drink #=> ":tangerine:"

# Random Slack Emoji from celebration category
Faker::SlackEmoji.celebration #=> ":ribbon:"

# Random Slack Emoji from activity category
Faker::SlackEmoji.activity #=> ":performing_arts:"

# Random Slack Emoji from travel and places category
Faker::SlackEmoji.travel_and_places #=> ":truck:"

# Random Slack Emoji from objects & symbols category
Faker::SlackEmoji.objects_and_symbols #=> ":alarm_clock:"

# Random Slack Emoji from custom category
Faker::SlackEmoji.custom #=> ":suspect:"

# Random Slack Emoji from any category
Faker::SlackEmoji.emoji #=> ":last_quarter_moon:"

```

###Faker::Team
-----------------

```ruby

# Random Team Creature
Faker::Team.creature #=> "gooses"

# Random Team Name created from random US State (Faker::Address.state) prepended to a random Team Creature
Faker::Team.name #=> "Oregon vixens"

# Random Team State
Faker::Team.state #=> "Oregon"

# Random Team Sport
Faker::Team.sport #=> "lacrosse"

```

###Faker::Book
------------------

```ruby

# Random Book Title
Faker::Book.title #=> "The Odd Sister"

# Random Author
Faker::Book.author #=> "Alysha Olsen"

# Random Publisher
Faker::Book.publisher #=> "Opus Reader"

# Random Genre
Faker::Book.genre #=> "Mystery"

```

###Faker::University
------------------

```ruby

# Random University Name
Faker::University.name #=> "South Texas College"

```

###Faker::Placeholdit
----------------

```ruby

# Optional parameters: size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil
Faker::Placeholdit.image #=> "http://placehold.it/300x300.png/000"

Faker::Placeholdit.image(size: "50x50") #=> "http://placehold.it/50x50.png/000"

Faker::Placeholdit.image(size: "50x50", format: 'jpg') #=> "http://placehold.it/50x50.jpg/000"

Faker::Placeholdit.image(size: "50x50", format: 'gif', background_color: 'ffffff') #=> "http://placehold.it/50x50.gif/ffffff"

Faker::Placeholdit.image(size: "50x50", format: 'jpeg', background_color: 'ffffff', text_color: '000') #=> "http://placehold.it/50x50.jpeg/ffffff/000"

Faker::Placeholdit.image(size: "50x50", format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text') #=> "http://placehold.it/50x50.jpg/ffffff/000?text='Some Custom Text'"

```

###Faker::Hipster
----------------
Adapted from [Hipster Ipsum](http://hipsum.co/)

```ruby

Faker::Hipster.word #=> "irony"

# Optional arguments: count: 3, supplemental: false, spaces_allowed: false
Faker::Hipster.words #=> ["pug", "pitchfork", "chia"]
Faker::Hipster.words(count: 4) #=> ["ugh", "cardigan", "poutine", "stumptown"]
Faker::Hipster.words(count: 4, supplemental: true) #=> ["iste", "seitan", "normcore", "provident"]
Faker::Hipster.words(count: 4, supplemental: true, spaces_allowed: true) #=> ["qui", "magni", "craft beer", "est"]

# Optional arguments: word_count: 4, supplemental: false, random_words_to_add: 6
Faker::Hipster.sentence #=> "Park iphone leggings put a bird on it."
Faker::Hipster.sentence(word_count: 3) #=> "Pour-over swag godard."
Faker::Hipster.sentence(word_count: 3, supplemental: true) #=> "Beard laboriosam sequi celiac."
Faker::Hipster.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) #=> "Bitters retro mustache aesthetic biodiesel 8-bit."
Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 4) #=> "Occaecati deleniti messenger bag meh crucifix autem."

# Optional arguments: count: 3, supplemental: false
Faker::Hipster.sentences #=> ["Godard pitchfork vinegar chillwave everyday 90's whatever.", "Pour-over artisan distillery street waistcoat.", "Salvia yr leggings franzen blue bottle."]
Faker::Hipster.sentences(count: 1) #=> ["Before they sold out pinterest venmo umami try-hard ugh hoodie artisan."]
Faker::Hipster.sentences(count: 1, supplemental: true) #=> ["Et sustainable optio aesthetic et."]

# Optional arguments: sentence_count: 3, supplemental: false, random_sentences_to_add: 3
Faker::Hipster.paragraph #=> "Migas fingerstache pbr&b tofu. Polaroid distillery typewriter echo tofu actually. Slow-carb fanny pack pickled direct trade scenester mlkshk plaid. Banjo venmo chambray cold-pressed typewriter. Fap skateboard intelligentsia."
Faker::Hipster.paragraph(sentence_count: 2) #=> "Yolo tilde farm-to-table hashtag. Lomo kitsch disrupt forage +1."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: true) #=> "Typewriter iste ut viral kombucha voluptatem. Sint voluptates saepe. Direct trade irony chia excepturi yuccie. Biodiesel esse listicle et quam suscipit."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) #=> "Selvage vhs chartreuse narwhal vinegar. Authentic vinyl truffaut carry vhs pop-up. Hammock everyday iphone locavore thundercats bitters vegan goth. Fashion axe banh mi shoreditch whatever artisan."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) #=> "Deep v gluten-free unde waistcoat aperiam migas voluptas dolorum. Aut drinking illo sustainable sapiente. Direct trade fanny pack kale chips ennui semiotics."

# Optional arguments: count: 3, supplemental: false
Faker::Hipster.paragraphs #=> ["Tilde microdosing blog cliche meggings. Intelligentsia five dollar toast forage yuccie. Master kitsch knausgaard. Try-hard everyday trust fund mumblecore.", "Normcore viral pickled. Listicle humblebrag swag tote bag. Taxidermy street hammock neutra butcher cred kale chips. Blog portland humblebrag trust fund irony.", "Single-origin coffee fixie cleanse tofu xoxo. Post-ironic tote bag ramps gluten-free locavore mumblecore hammock. Umami loko twee. Ugh kitsch before they sold out."]
Faker::Hipster.paragraphs(count: 1) #=> ["Skateboard cronut synth +1 fashion axe. Pop-up polaroid skateboard asymmetrical. Ennui fingerstache shoreditch before they sold out. Tattooed pitchfork ramps. Photo booth yr messenger bag raw denim bespoke locavore lomo synth."]
Faker::Hipster.paragraphs(count: 1, supplemental: true) #=> ["Quae direct trade pbr&b quo taxidermy autem loko. Umami quas ratione migas cardigan sriracha minima. Tenetur perspiciatis pickled sed eum doloribus truffaut. Excepturi dreamcatcher meditation."]
```

###Faker::Superhero
------------------

```ruby

# Random Superhero name
Faker::Superhero.name #=> "Magnificent Shatterstar"

# Random Superhero power
Faker::Superhero.power #=> "Photokinesis"
```


###Faker::StarWars
----------------

```ruby
Faker::StarWars.character #=> "Anakin Skywalker"

Faker::StarWars.droid #=> "C-3PO"

Faker::StarWars.planet #=> "Tatooine"

Faker::StarWars.quote #=> "Aren’t you a little short for a Stormtrooper?"

Faker::StarWars.specie #=> "Gungan"

Faker::StarWars.vehicle #=> "Sandcrawler"
```

###Faker::Beer
----------------

```ruby
Faker::Beer.name #=> "Hercules Double IPA"

Faker::Beer.style #=> "Belgian Strong Ale"

Faker::Beer.hop #=> "Equinox"

Faker::Beer.yeast #=> "2278 - Czech Pils"

Faker::Beer.malts #=> "Rye malt"

Faker::Beer.ibu #=> "40 IBU"

Faker::Beer.alcohol #=> "6.3%"

Faker::Beer.blg #=> "18.5°Blg"
```

###Faker::ChuckNorris
----------------

```ruby
Faker::ChuckNorris.fact #=> "Chuck Norris can solve the Towers of Hanoi in one move."
```

###Faker::Educator
-------------------

```ruby
Faker::Educator.university #=> "Mallowtown Technical College"

Faker::Educator.secondary_school #=> "Iceborough Secodary College"

Faker::Educator.course #=> "Associate Degree in Criminology"

Faker::Educator.campus #=> "Vertapple Campus"
```

###Faker::Space
----------------

```ruby
# Random planet from our Solar System
Faker::Space.planet #=> "Venus"

# Random moon from our Solar System
Faker::Space.moon #=> "Europa"

# Random galaxy
Faker::Space.galaxy #=> "Andromeda"

# Random nebula name
Faker::Space.nebula #=> "Triffid Nebula"

# Random star cluster
Faker::Space.star_cluster #=> "Messier 70"

# Random constellation
Faker::Space.constellation #=> "Orion"

# Random star
Faker::Space.star #=> "Proxima Centauri"

# Random national space agency
Faker::Space.agency #=> "Japan Aerospace Exploration Agency"

# Random space agency abbreviation
Faker::Space.agency_abv #=> "NASA"

# Random spacecraft name (limited to NASA)
Faker::Space.nasa_space_craft #=> "Endeavour"

# Random private space company title
Faker::Space.company #=> "SpaceX"

# Random unit of stellar distance with number
Faker::Space.distance_measurement #=> "15 parsecs"
```


###Faker::Music
-------------------

```ruby
Faker::Music.key #=> "C"

Faker::Music.instrument #=> "Ukelele"
```

###Faker::Vehicle
------------------

```ruby

# Generate vehicle identification number
Faker::Vehicle.vin #=> "LLDWXZLG77VK2LUUF"

# Random vehicle manufacturer
Faker::Vehicle.manufacture #=> "JAGUAR CARS LTD"
```

Customization
------------
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

Contributing
------------
See [CONTRIBUTING.md](https://github.com/stympy/faker/blob/master/CONTRIBUTING.md).

Contact
-------
Comments and feedback are welcome. Send an email to Benjamin Curtis via the [google group](http://groups.google.com/group/ruby-faker).

License
-------
This code is free to use under the terms of the MIT license.
