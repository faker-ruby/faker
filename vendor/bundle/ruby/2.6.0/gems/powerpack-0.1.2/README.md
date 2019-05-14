[![Gem Version](https://badge.fury.io/rb/powerpack.svg)](http://badge.fury.io/rb/powerpack)
[![Build Status](https://travis-ci.org/bbatsov/powerpack.svg?branch=master)](https://travis-ci.org/bbatsov/powerpack)

# Powerpack

Powerpack offers some useful extensions to the standard Ruby classes (kind of like `ActiveSupport`, but less ambitious and more modular).

## Installation

Add this line to your application's `Gemfile` (if you're using `bundler`, that is):

    gem 'powerpack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install powerpack

## Extensions

* [Array](http://rdoc.info/github/bbatsov/powerpack/Array)
    * [#butfirst](http://rdoc.info/github/bbatsov/powerpack/Array#butfirst-instance_method)
    * [#butlast](http://rdoc.info/github/bbatsov/powerpack/Array#butlast-instance_method)
* [Enumerable](http://rdoc.info/github/bbatsov/powerpack/Enumerable)
    * [#average](http://rdoc.info/github/bbatsov/powerpack/Enumerable#average-instance_method)
    * [#drop_last](http://rdoc.info/github/bbatsov/powerpack/Enumerable#drop_last-instance_method)
    * [#drop_last_while](http://rdoc.info/github/bbatsov/powerpack/Enumerable#drop_last_while-instance_method)
    * [#exactly?](http://rdoc.info/github/bbatsov/powerpack/Enumerable#exactly?-instance_method)
    * [#frequencies](http://rdoc.info/github/bbatsov/powerpack/Enumerable#frequencies-instance_method)
    * [#several?](http://rdoc.info/github/bbatsov/powerpack/Enumerable#several?-instance_method)
    * [#sum](http://rdoc.info/github/bbatsov/powerpack/Enumerable#sum-instance_method)
    * [#take_last](http://rdoc.info/github/bbatsov/powerpack/Enumerable#take_last-instance_method)
    * [#take_last_while](http://rdoc.info/github/bbatsov/powerpack/Enumerable#take_last_while-instance_method)
* [Hash](http://rdoc.info/github/bbatsov/powerpack/Hash)
    * [#symbolize_keys](http://rdoc.info/github/bbatsov/powerpack/Hash#symbolize_keys-instance_method)
* [Numeric](http://rdoc.info/github/bbatsov/powerpack/Numeric)
    * [#pos?](http://rdoc.info/github/bbatsov/powerpack/Numeric#pos?-instance_method)
    * [#neg?](http://rdoc.info/github/bbatsov/powerpack/Numeric#neg?-instance_method)
    * [#hundred](http://rdoc.info/github/bbatsov/powerpack/Numeric#hundred-instance_method)
    * [#thousand](http://rdoc.info/github/bbatsov/powerpack/Numeric#thousand-instance_method)
    * [#million](http://rdoc.info/github/bbatsov/powerpack/Numeric#million-instance_method)
    * [#billion](http://rdoc.info/github/bbatsov/powerpack/Numeric#billion-instance_method)
    * [#trillion](http://rdoc.info/github/bbatsov/powerpack/Numeric#trillion-instance_method)
    * [#quadrillion](http://rdoc.info/github/bbatsov/powerpack/Numeric#quadrillion-instance_method)
* [String](http://rdoc.info/github/bbatsov/powerpack/String)
    * [#ascii_only](http://rdoc.info/github/bbatsov/powerpack/String#ascii_only-instance_method)
    * [#ascii_only!](http://rdoc.info/github/bbatsov/powerpack/String#ascii_only!-instance_method)
    * [#blank?](http://rdoc.info/github/bbatsov/powerpack/String#blank?-instance_method)
    * [#format](http://rdoc.info/github/bbatsov/powerpack/String#format-instance_method)
    * [#remove](http://rdoc.info/github/bbatsov/powerpack/String#remove-instance_method)
    * [#remove!](http://rdoc.info/github/bbatsov/powerpack/String#remove!-instance_method)
    * [#remove_prefix](http://rdoc.info/github/bbatsov/powerpack/String#remove_prefix-instance_method)
    * [#remove_prefix!](http://rdoc.info/github/bbatsov/powerpack/String#remove_prefix!-instance_method)
    * [#remove_suffix](http://rdoc.info/github/bbatsov/powerpack/String#remove_suffix-instance_method)
    * [#remove_suffix!](http://rdoc.info/github/bbatsov/powerpack/String#remove_suffix!-instance_method)
    * [#strip_indent](http://rdoc.info/github/bbatsov/powerpack/String#strip_indent-instance_method)
    * [#strip_margin](http://rdoc.info/github/bbatsov/powerpack/String#strip_margin-instance_method)
    * [#squish](http://rdoc.info/github/bbatsov/powerpack/String#squish-instance_method)
    * [#squish!](http://rdoc.info/github/bbatsov/powerpack/String#squish!-instance_method)

## Documentation

A listing of the extensions provided by Powerpack is available
[here](http://rdoc.info/github/bbatsov/powerpack).

## Usage

To load the entire `powerpack` do:

```
require 'powerpack'
```

To load only the `String` extensions do:

```
require 'powerpack/string'
```

To load only a specific extension like `String#format` do:

```
require 'powerpack/string/format'
```

## Changelog

Powerpack's changelog is available [here](CHANGELOG.md).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
