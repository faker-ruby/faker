Faker
=====
This gem is a port of Perl's Data::Faker library that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

NOTE: While Faker generates data at random, returned values are not guaranteed to be unique.

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

###Faker::Address
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
Faker::Bitcoin.testnet_address #=> ""msHGunDvoEwmVFXvd2Bub1SNw5RP1YHJaf""

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

```

###Faker::Commerce
------------------

```ruby

Faker::Commerce.color #=> "lavender"

# Optional arguments max=3, fixed_amount=false
Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.department(5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(2, true) #=> "Books & Tools"

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

# Get a random profession
Faker::Company.profession #=> "firefighter"

```

###Faker::Date
---------------------

```ruby
# Random date between dates
Faker::Date.between(2.days.ago, Date.today) #=> "Wed, 24 Sep 2014"

# Random date in the future (up to maximum of N days)
Faker::Date.forward(23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
Faker::Date.backward(14) #=> "Fri, 19 Sep 2014"
```

###Faker::Internet
---------------

```ruby
# Optional argument name=nil
Faker::Internet.email #=> "eliza@mann.net"

Faker::Internet.email('Nancy') #=> "nancy@terry.biz"

# Optional argument name=nil
Faker::Internet.free_email #=> "freddy@gmail.com"

Faker::Internet.free_email('Nancy') #=> "nancy@yahoo.com"

# Optional argument name=nil
Faker::Internet.safe_email #=> "christelle@example.org"

Faker::Internet.safe_email('Nancy') #=> "nancy@example.net"

# Optional arguments specifier=nil, separators=%w(. _)
Faker::Internet.user_name #=> "alexie"

Faker::Internet.user_name('Nancy') #=> "nancy"

Faker::Internet.user_name('Nancy Johnson', %w(. _ -)) #=> "johnson-nancy"

# Optional arguments: min_length=8, max_length=16
Faker::Internet.password #=> "vg5msvy1uerg7"

Faker::Internet.password(8) #=> "yfgjik0hgzdqs0"

Faker::Internet.password(10, 20) #=> "eoc9shwd1hwq4vbgfw"

Faker::Internet.password(10, 20, true) #=> "3k5qS15aNmG"

Faker::Internet.password(10, 20, true, true) #=> "*%NkOnJsH4"

Faker::Internet.domain_name #=> "effertz.info"

Faker::Internet.fix_umlauts('äöüß') #=> "aeoeuess"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"

Faker::Internet.ip_v4_address #=> "24.29.18.175"

# Guaranteed not to be in 10.0.0.0/8, 127.0.0.0/8, 169.254.0.0/16,
# 172.16.0.0/12, or 192.168.0.0/16
Faker::Internet.public_ip_v4_address #=> "24.29.18.175"

Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

# Optional argument prefix=''
Faker::Internet.mac_address #=> "e6:0d:00:11:ed:4f"
Faker::Internet.mac_address('55:44:33') #=> "55:44:33:02:1d:9b"

# Optional arguments: host=domain_name, path="/#{user_name}"
Faker::Internet.url #=> "http://thiel.com/chauncey_simonis"
Faker::Internet.url('example.com') #=> "http://example.com/clotilde.swift"
Faker::Internet.url('example.com', '/foobar.html') #=> "http://example.com/foobar.html"

# Optional arguments: words=nil, glue=nil
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug('foo bar') #=> "foo.bar"
Faker::Internet.slug('foo bar', '-') #=> "foo-bar"


```

###Faker::Lorem
---------------

```ruby

Faker::Lorem.word #=> "repellendus"

# Optional arguments: num=3, supplemental=false
Faker::Lorem.words #=> ["dolores", "adipisci", "nesciunt"]
Faker::Lorem.words(4) #=> ["culpa", "recusandae", "aut", "omnis"]
Faker::Lorem.words(4, true) #=> ["colloco", "qui", "vergo", "deporto"]

# Optional arguments: char_count=255
Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
Faker::Lorem.characters(10) #=> "ang9cbhoa8"

# Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
Faker::Lorem.sentence(3) #=> "Commodi qui minus deserunt sed vero quia."
Faker::Lorem.sentence(3, true) #=> "Inflammatio denego necessitatibus caelestis autus illum."
Faker::Lorem.sentence(3, false, 4) #=> "Aut voluptatem illum fugit ut sit."
Faker::Lorem.sentence(3, true, 4) #=> "Accusantium tantillus dolorem timor."

# Optional arguments: sentence_count=3, supplemental=false
Faker::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
Faker::Lorem.sentences(1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
Faker::Lorem.sentences(1, true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]

# Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
Faker::Lorem.paragraph #=> "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
Faker::Lorem.paragraph(2) #=> "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
Faker::Lorem.paragraph(2, true) #=> "Cedo vero adipisci. Theatrum crustulum coaegresco tonsor crastinus stabilis. Aliqua crur consequatur amor una tolero sum."
Faker::Lorem.paragraph(2, false, 4) #=> "Neque aut et nemo aut incidunt voluptates. Dolore cum est sint est. Vitae assumenda porro odio dolores fugiat. Est voluptatum quia rerum."
Faker::Lorem.paragraph(2, true, 4) #=> "Vomito unde uxor annus. Et patior utilis sursum."

# Optional arguments: paragraph_count=3, supplemental=false
Faker::Lorem.paragraphs #=> ["Dolores quis quia ad quo voluptates. Maxime delectus totam numquam. Necessitatibus vel atque qui dolore.", "Id neque nemo. Dolores iusto facere est ad. Accusamus ipsa dolor ut.", "Et officiis ut hic. Sunt asperiores minus distinctio debitis ipsa dolor. Minima eos deleniti."]
Faker::Lorem.paragraphs(1) #=> ["Labore voluptas sequi. Ratione nulla eaque quia molestiae fugit. At quam laboriosam aut ut dignissimos."]
Faker::Lorem.paragraphs(1, true) #=> ["Depulso animi cunctatio amicitia adficio. Vester viduo qui despirmatio voluptas. Validus laudantium adopto ut agnitio venustas. Aer arcus odio esse."]

```

###Faker::Name
--------------

```ruby

Faker::Name.name #=> "Tyshawn Johns Sr."

Faker::Name.first_name #=> "Kaci"

Faker::Name.last_name #=> "Ernser"

Faker::Name.prefix #=> "Mr."

Faker::Name.suffix #=> "IV"

Faker::Name.title #=> "Legacy Creative Director"

```

###Faker::Avatar
----------------

```ruby

Faker::Avatar.image #=> "https://robohash.org/sitsequiquia.png?size=300x300"

Faker::Avatar.image("my-own-slug") #=> "https://robohash.org/my-own-slug.png?size=300x300"

Faker::Avatar.image("my-own-slug", "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50"

Faker::Avatar.image("my-own-slug", "50x50", "jpg") #=> "https://robohash.org/my-own-slug.jpg?size=50x50"

Faker::Avatar.image("my-own-slug", "50x50", "bmp") #=> "https://robohash.org/my-own-slug.bmp?size=50x50"

Faker::Avatar.image("my-own-slug", "50x50", "bmp", "set1", "bg1") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
```

###Faker::Number
----------------

```ruby

# Required parameter: digits
Faker::Number.number(10) #=> "1968353479"

# Required parameter: l_digits
Faker::Number.decimal(2) #=> "11.88"

Faker::Number.decimal(2, 3) #=> "18.843"

# Required parameter: digits
Faker::Number.hexadecimal(3) #=> "e74"

Faker::Number.between(1, 10) #=> 7

Faker::Number.positive #=> 235.59238499107653

Faker::Number.negative #=> -4480.042585669558

Faker::Number.digit #=> "1"

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

# Optional parameter: length=4
Faker::PhoneNumber.subscriber_number #=> "3873"

Faker::PhoneNumber.subscriber_number(2) #=> "39"

Faker::PhoneNumber.extension #=> "3764"

```

###Faker::Time
---------------------

```ruby
# Random date between dates
Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
# You can install the active_support gem to facilitate time manipulation like 45.minutes + 2.hours
require "as-duration"
Faker::Time.between(2.days.ago, Time.now, :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between(2.days.ago, Time.now, :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between(2.days.ago, Time.now, :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between(2.days.ago, Time.now, :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between(2.days.ago, Time.now, :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between(2.days.ago, Time.now, :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between(2.days.ago, Time.now, :midnight) #=> "2014-09-20 00:40:14 -0700"

# Random time in the future (up to maximum of N days)
Faker::Time.forward(23, :morning) # => "2014-09-26 06:54:47 -0700"

# Random time in the past (up to maximum of N days)
Faker::Time.backward(14, :evening) #=> "2014-09-17 19:56:33 -0700"
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

Faker::Placeholdit.image #=> "http://placehold.it/300x300.png/000"

Faker::Placeholdit.image("50x50") #=> "http://placehold.it/50x50.png/000"

Faker::Placeholdit.image("50x50", 'jpg') #=> "http://placehold.it/50x50.jpg/000"

Faker::Placeholdit.image("50x50", 'gif', 'ffffff') #=> "http://placehold.it/50x50.gif/ffffff"

Faker::Placeholdit.image("50x50", 'jpeg', 'ffffff', '000') #=> "http://placehold.it/50x50.jpeg/ffffff/000"

Faker::Placeholdit.image("50x50", 'jpg', 'ffffff', '000', 'Some Custom Text') #=> "http://placehold.it/50x50.jpg/ffffff/000?text='Some Custom Text'"

```

###Faker::Hipster
----------------
Adapted from [Hipster Ipsum](http://hipsum.co/)

```ruby

Faker::Hipster.word #=> "irony"

# Optional arguments: num=3, supplemental=false, spaces_allowed = false
Faker::Hipster.words #=> ["pug", "pitchfork", "chia"]
Faker::Hipster.words(4) #=> ["ugh", "cardigan", "poutine", "stumptown"]
Faker::Hipster.words(4, true) #=> ["iste", "seitan", "normcore", "provident"]
Faker::Hipster.words(4, true, true) #=> ["qui", "magni", "craft beer", "est"] 

# Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
Faker::Hipster.sentence #=> "Park iphone leggings put a bird on it."
Faker::Hipster.sentence(3) #=> "Pour-over swag godard."
Faker::Hipster.sentence(3, true) #=> "Beard laboriosam sequi celiac."
Faker::Hipster.sentence(3, false, 4) #=> "Bitters retro mustache aesthetic biodiesel 8-bit."
Faker::Hipster.sentence(3, true, 4) #=> "Occaecati deleniti messenger bag meh crucifix autem."

# Optional arguments: sentence_count=3, supplemental=false
Faker::Hipster.sentences #=> ["Godard pitchfork vinegar chillwave everyday 90's whatever.", "Pour-over artisan distillery street waistcoat.", "Salvia yr leggings franzen blue bottle."]
Faker::Hipster.sentences(1) #=> ["Before they sold out pinterest venmo umami try-hard ugh hoodie artisan."]
Faker::Hipster.sentences(1, true) #=> ["Et sustainable optio aesthetic et."]

# Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
Faker::Hipster.paragraph #=> "Migas fingerstache pbr&b tofu. Polaroid distillery typewriter echo tofu actually. Slow-carb fanny pack pickled direct trade scenester mlkshk plaid. Banjo venmo chambray cold-pressed typewriter. Fap skateboard intelligentsia."
Faker::Hipster.paragraph(2) #=> "Yolo tilde farm-to-table hashtag. Lomo kitsch disrupt forage +1."
Faker::Hipster.paragraph(2, true) #=> "Typewriter iste ut viral kombucha voluptatem. Sint voluptates saepe. Direct trade irony chia excepturi yuccie. Biodiesel esse listicle et quam suscipit."
Faker::Hipster.paragraph(2, false, 4) #=> "Selvage vhs chartreuse narwhal vinegar. Authentic vinyl truffaut carry vhs pop-up. Hammock everyday iphone locavore thundercats bitters vegan goth. Fashion axe banh mi shoreditch whatever artisan."
Faker::Hipster.paragraph(2, true, 4) #=> "Deep v gluten-free unde waistcoat aperiam migas voluptas dolorum. Aut drinking illo sustainable sapiente. Direct trade fanny pack kale chips ennui semiotics."

# Optional arguments: paragraph_count=3, supplemental=false
Faker::Hipster.paragraphs #=> ["Tilde microdosing blog cliche meggings. Intelligentsia five dollar toast forage yuccie. Master kitsch knausgaard. Try-hard everyday trust fund mumblecore.", "Normcore viral pickled. Listicle humblebrag swag tote bag. Taxidermy street hammock neutra butcher cred kale chips. Blog portland humblebrag trust fund irony.", "Single-origin coffee fixie cleanse tofu xoxo. Post-ironic tote bag ramps gluten-free locavore mumblecore hammock. Umami loko twee. Ugh kitsch before they sold out."]
Faker::Hipster.paragraphs(1) #=> ["Skateboard cronut synth +1 fashion axe. Pop-up polaroid skateboard asymmetrical. Ennui fingerstache shoreditch before they sold out. Tattooed pitchfork ramps. Photo booth yr messenger bag raw denim bespoke locavore lomo synth."]
Faker::Hipster.paragraphs(1, true) #=> ["Quae direct trade pbr&b quo taxidermy autem loko. Umami quas ratione migas cardigan sriracha minima. Tenetur perspiciatis pickled sed eum doloribus truffaut. Excepturi dreamcatcher meditation."]
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
