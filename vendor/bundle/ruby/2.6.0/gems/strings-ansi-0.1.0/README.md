<div align="center">
  <img width="225" src="https://cdn.rawgit.com/piotrmurach/strings/master/assets/strings_logo.png" alt="strings logo" />
</div>

# Strings::ANSI

[![Gem Version](https://badge.fury.io/rb/strings-ansi.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/strings-ansi.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/amffv5g25m02yu9h?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/7c018a761a342ccb0746/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/strings-ansi/badge.svg?branch=master)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/strings-ansi.svg?branch=master)][inchpages]

[gem]: http://badge.fury.io/rb/strings-ansi
[travis]: http://travis-ci.org/piotrmurach/strings-ansi
[appveyor]: https://ci.appveyor.com/project/piotrmurach/strings-ansi
[codeclimate]: https://codeclimate.com/github/piotrmurach/strings-ansi/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/strings-ansi?branch=master
[inchpages]: http://inch-ci.org/github/piotrmurach/strings-ansi

> Handle ANSI escape codes in strings.

**Strings::ANSI** provides ANSI handling for [Strings](https://github.com/piotrmurach/strings) utilities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strings-ansi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strings-ansi

## Contents

* [1. Usage](#1-usage)
* [2. API](#2-api)
  * [2.1 ansi?](#21-ansi)
  * [2.2 only_ansi?](#22-only_ansi)
  * [2.3 sanitize](#23-sanitize)
* [3. Extending String class](#3-extending-string-class)

## Usage

The `Strings::ANSI` is a module with functions that can be called directly.

```ruby
Strings::ANSI.ansi?('...')
```

## 2. API

### 2.1 ansi?

To check if a string includes ANSI escape codes use `ansi?` like so:

```ruby
Strings::ANSI.ansi?("\e[33;44mfoo\e[0m")
# => true
```

### 2.2 only_ansi?

To check if a string includes only ANSI escape codes use `only_ansi?`:

```ruby
Strings::ANSI.only_ansi?("\e[33;44mfoo\e[0m")
# => false
```

### 2.3 sanitize

To remove ANSI codes from a string use `sanitize`:

```ruby
Strings::ANSI.sanitize("\e[0;33;49mHello\e[0m")
# => Hello
```

## 3. Extending String class

Though it is highly discouraged to polute core Ruby classes, you can add the required methods to `String` class by using refinements.

For example, if you wish to only extend strings with `sanitize` method do:

```ruby
module MyStringExt
  refine String do
    def sanitize
      Strings::ANSI.sanitize(self)
    end
  end
end
```

then `sanitize` method will be available for any strings where refinement is applied:

```ruby
using MyStringExt

string.sanitize("\e[32mHello\e[0m")
# => Hello
```

Alternatively, if you want to include all the **Strings::ANSI** methods:

```ruby
require 'strings/ansi/extensions'

using Strings::ANSI::Extensions
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/strings-ansi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Strings::Ansi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/strings-ansi/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2018 Piotr Murach. See LICENSE for further details.
