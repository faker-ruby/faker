Faker
=====
This gem is a port of Perl's Data::Faker library that generates fake data.

It comes in very handy for taking screenshots (taking screenshots for my
project, [Catch the Best](http://catchthebest.com/) was the original impetus
for the creation of this gem), having real-looking test data, and having your
database populated with more than one or two records while you're doing
development.

Usage
-----
* Faker::Name.name => "Christophe Bartell"
* Faker::Internet.email => "kirsten.greenholt@corkeryfisher.info"
* Faker::Company.bs => "monetize integrated bandwidth"
* Faker::Address.street_address => "544 Mertz Estate"
* Faker::Address.street_address(:include_secondary) => "459 Luettgen Overpass Apt. 846"
* name = Faker::Name.name => "Julius Champlin"
* Faker::Internet.email(name) => "julius.champlin@schoen.biz"
* Faker::Internet.free_email(name) => "julius.champlin@hotmail.com"
* Faker::Config.locale = :nl
* Faker::Name.name => "Roos Janssen"
* Faker::Address.city => "Zuid Stijndam"
* Faker::Address.street_name => ""Bos straat"

You can get addresses from different locales by sending in the locale code to the Address#in method.
Faker::Address.in(:en)
  => #<Faker::Address:0x00000101164840 @street_address="7076 Marquise Falls", @city="East Magnoliaside", @postcode="26161-5481", @state="Wisconsin", @country="United States of America">
Faker::Address.in(:"no-nb")
  => #<Faker::Address:0x00000102076d88 @street_address="Malmtoppen 58, Oppgang A", @city="Uthelle", @postcode="5616", @state="", @country="Norge">

This does not change the locale settings.
It assumes that the locale requested exists.
Check I18n.available_locales if you are unsure.

Usage with Rails
----------------

If you want to change your locale with Rails from the default of :en, change
config/application.rb, setting config.i18n.locale to whatever locale you
want.  Change locale rather than default_locale (as suggested by the comments
in that file) so that I18n's fallbacks will work properly and Faker can use
the formats and data in en.yml (if there is no Faker localization for your
locale).  If you'd prefer to set default_locale rather than locale, then
you'll also need to add config.i18n.fallbacks.defaults = [:en] to your
configuration to make the fallbacks work for Faker.


Customization
------------
Since you may want to make addresses and other types of data look different
depending on where in the world you are (US postal codes vs. UK postal codes,
for example), Faker uses the I18n gem to store strings (like state names) and
formats (US postal codes are NNNNN while UK postal codes are AAN NAA),
allowing you to get different formats by switching locales.  Just set
Faker::Config.locale to the locale you want, and Faker will take care of the
rest.

Contributing
------------
If you'd like to contribute code or formats/data for another locale, fork
the project at [github](https://github.com/stympy/faker), make your changes,
then send a pull request.

Contact
-------
Comments and feedback are welcome. Send an email to Benjamin Curtis via the [google group](http://groups.google.com/group/ruby-faker).

License
-------
This code is free to use under the terms of the MIT license.

