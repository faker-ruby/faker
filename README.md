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


