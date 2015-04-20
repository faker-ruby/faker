Faker
=====
This gem is a port of Perl's Data::Faker library that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

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

Faker::Address.state_abbr #=> "AP"

Faker::Address.state #=> "California"

Faker::Address.country #=> "French Guiana"

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

# When a straight answer won't do, BS to the rescue!
Faker::Company.bs #=> "empower one-to-one web-readiness"

Faker::Company.ein #=> "34-8488813"

Faker::Company.duns_number #=> "08-341-3736"

# Get a random company logo url in PNG format.
Faker::Company.logo #=> "http://pigment.github.com/fake-logos/logos/medium/color/5.png"

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

Faker::Internet.domain_name #=> "effertz.info"

Faker::Internet.fix_umlauts('äöüß') #=> "aeoeuess"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"

Faker::Internet.ip_v4_address #=> "24.29.18.175"

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
Faker::Lorem.paragraph(2, true) #=> ""
Faker::Lorem.paragraph(2, false, 4) #=> ""
Faker::Lorem.paragraph(2, true, 4) #=> ""

# Optional arguments: paragraph_count=3, supplemental=false
Faker::Lorem.paragraphs #=> ""
Faker::Lorem.paragraphs(1) #=> ""
Faker::Lorem.paragraphs(1, true) #=> ""

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

Faker::Avatar.image #=> "http://robohash.org/sitsequiquia.png?size=300x300"

Faker::Avatar.image("my-own-slug") #=> "http://robohash.org/my-own-slug.png?size=300x300"

Faker::Avatar.image("my-own-slug", "50x50") #=> "http://robohash.org/my-own-slug.png?size=50x50"

Faker::Avatar.image("my-own-slug", "50x50", "jpg") #=> "http://robohash.org/my-own-slug.jpg?size=50x50"

Faker::Avatar.image("my-own-slug", "50x50", "bmp") #=> "http://robohash.org/my-own-slug.bmp?size=50x50"
```

###Faker::Number
----------------

```ruby

# Required parameter: digits
Faker::Number.number(10) #=> "1968353479"

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
Faker::Time.between(2.days.ago, Time.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
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
      # Exiting faker field, new data
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
