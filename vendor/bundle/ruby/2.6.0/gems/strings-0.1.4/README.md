<div align="center">
  <img width="225" src="https://cdn.rawgit.com/piotrmurach/strings/master/assets/strings_logo.png" alt="strings logo" />
</div>

# Strings

[![Gem Version](https://badge.fury.io/rb/strings.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/strings.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/e11tn1fgjwnfwp3r?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/4ca50e480f42af80678e/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/strings/badge.svg?branch=master)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/strings.svg?branch=master)][inchpages]

[gem]: http://badge.fury.io/rb/strings
[travis]: http://travis-ci.org/piotrmurach/strings
[appveyor]: https://ci.appveyor.com/project/piotrmurach/strings
[codeclimate]: https://codeclimate.com/github/piotrmurach/strings/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/strings?branch=master
[inchpages]: http://inch-ci.org/github/piotrmurach/strings

> The `Strings` is a set of useful functions such as fold, truncate, wrap, and many more for transforming strings.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strings

## Features

* No monkey-patching String class
* Functional API that can be easily wrapped by other objects
* Supports multibyte character encodings such as UTF-8, EUC-JP
* Handles languages without whitespaces between words (like Chinese and Japanese)
* Supports ANSI escape codes

## Contents

* [1. Usage](#1-usage)
* [2. API](#2-api)
  * [2.1 align](#21-align)
  * [2.2 ansi?](#22-ansi)
  * [2.3 fold](#23-fold)
  * [2.4 pad](#24-pad)
  * [2.5 sanitize](#25-sanitize)
  * [2.6 truncate](#26-truncate)
  * [2.7 wrap](#27-wrap)
* [3. Extending String class](#3-extending-string-class)
* [4. Utilities](#4-utilities)

## 1. Usage

**Strings** is a module with stateless function calls which can be executed directly or mixed into other classes.

For example, to wrap a text using [wrap](#22-wrap) method, you can call it directly:

```ruby
text = "Think not, is my eleventh commandment; and sleep when you can, is my twelfth."
Strings.wrap(text, 30)
# =>
#  "Think not, is my eleventh\n"
#  "commandment; and sleep when\n"
#  "you can, is my twelfth."
```

or using namespaced name:

```ruby
Strings::Wrap.wrap(text, 30)
```

## 2. API

### 2.1 align

To align a given multiline text within a given `width` use `align`, `align_left`, `align_center` or `align_right`.

Given the following multiline text:

```ruby
text = <<-TEXT
for there is no folly of the beast
of the earth which
is not infinitely
outdone by the madness of men
TEXT
```

Passing `text` as first argument, the maximum width and `:direction` to align to:

```ruby
Strings.align(text, 40, direction: :center)
# =>
#  "   for there is no folly of the beast   \n"
#  "           of the earth which           \n"
#  "           is not infinitely            \n"
#  "     outdone by the madness of men      "
```

You can also pass `:fill` option to replace default space character:

```ruby
Strings.align(text, 40, direction: :center, fill: '*')
# =>
#  "***for there is no folly of the beast***\n"
#  "***********of the earth which***********\n"
#  "***********is not infinitely************\n"
#  "*****outdone by the madness of men******"
```

It handles `UTF-8` text:

```ruby
text = "ラドクリフ\n、マラソン五輪\n代表に1万m出\n場にも含み"
Strings.align_left(text, 20)
# =>
#  "ラドクリフ          \n"
#  "、マラソン五輪      \n"
#  "代表に1万m出        \n"
#  "場にも含み          \n"
```

### 2.2 ansi?

To check if a string includes ANSI escape codes use `ansi?` like so:

```ruby
Strings.ansi?("\e[33;44mfoo\e[0m")
# => true
```

or

```ruby
Strings::ANSI.ansi?("\e[33;44mfoo\e[0m")
# => true
```

### 2.3 fold

To fold a multiline text into a single line preserving whitespace characters use `fold`:

```ruby
Strings.fold("\tfoo \r\n\n bar")
# => "foo  bar"
```

### 2.4 pad

To pad around a text with a given padding use `pad` function where the seconds argument is a padding value that needs to be one of the following values corresponding with CSS padding property:

```ruby
[1,1,1,1]  # => pad text left & right with 1 character and add 1 line above & below
[1,2]      # => pad text left & right with 2 characters and add 1 line above & below
1          # => shorthand for [1,1,1,1]
```

For example, to pad sentence with a padding of 1 space:

```ruby
text = "Ignorance is the parent of fear."
Strings.pad(text, 1)
# =>
#  "                                  \n"
#  " Ignorance is the parent of fear. \n"
#  "                                  "
```

You can also pass `:fill` option to replace default space character:

```ruby
text = "Ignorance is the parent of fear."
Strings.pad(text, [1, 2], fill: "*")
# =>
#  "************************************\n"
#  "**Ignorance is the parent of fear.**\n"
#  "************************************"
```

You can also apply padding to multiline content:

```ruby
text = <<-TEXT
It is the easiest thing
in the world for a man
to look as if he had
a great secret in him.
TEXT

Strings.pad(text, 1)
# =>
#  "                         \n"
#  " It is the easiest thing \n"
#  " in the world for a man \n"
#  " to look as if he had \n"
#  " a great secret in him. \n"
#  "                         "
```

The `pad` handles `UTF-8` text as well:

```ruby
text = "ラドクリフ、マラソン"
Strings.pad(text, 1)
# =>
# "                      \n"
# " ラドクリフ、マラソン \n"
# "                      "
```

### 2.5 sanitize

To remove ANSI escape codes from a string use `sanitize`:

```ruby
Strings.sanitize("\e[33;44mfoo\e[0m")
# => "foo"
```

or namespaced:

```ruby
Strings::ANSI.sanitize("\e[33;44mfoo\e[0m")
# => "foo"
```

### 2.6 truncate

You can truncate a given text after a given length with `truncate` method.

Given the following text:

```ruby
text = "for there is no folly of the beast of the earth " +
       "which is not infinitely outdone by the madness of men"
```

To shorten the text to given length call `truncate`:

```ruby
Strings.truncate(text, 20) # => "for there is no fol…"
```

or directly using the module namesapce:

```ruby
Strings::Truncate.truncate(text, 20) # => "for there is no fol…"
```

If you want to split words on their boundaries use `:separator` option:

```ruby
Strings.truncate(text, 20) # => "for there is no…"
```

Use `:trailing` option (by default `…`) to provide omission characters:

```ruby
Strings.truncate(text, 22, trailing: '... (see more)')
# => "for there...(see more)"
```

You can also specify `UTF-8` text as well:

```ruby
text = 'ラドクリフ、マラソン五輪代表に1万m出場にも含み'
Strings.truncate(text, 12)   # => "ラドクリフ…"
```

**Strings::Truncate** works with ANSI escape codoes:

```ruby
text = "I try \e[34mall things\e[0m, I achieve what I can"
Strings.truncate(text, 18)
# => "I try \e[34mall things\e[0m…"
```

### 2.7 wrap

To wrap text into lines no longer than `wrap_at` argument length, the `wrap` method will break either on whitespace character or in case of east Asian characters on character boundaries.

Given the following text:

```ruby
text "Think not, is my eleventh commandment; and sleep when you can, is my twelfth."
```

Then to wrap the text to given length do:

```ruby
Strings.wrap(text, 30)
# =>
#  "Think not, is my eleventh\n"
#  "commandment; and sleep when\n"
#  "you can, is my twelfth."
```

Similarly, to handle `UTF-8` text do:

```ruby
text = "ラドクリフ、マラソン五輪代表に1万m出場にも含み"
Strings.wrap(text, 8)
# =>
#  "ラドクリ\n"
#  "フ、マラ\n"
#  "ソン五輪\n"
#  "代表に1\n"
#  "万m出場\n"
#  "にも含み"
```

**Strings::Wrap** knows how to handle ANSI codes:

```ruby
ansi_text = "\e[32;44mIgnorance is the parent of fear.\e[0m"
Strings.wrap(ansi_text, 14)
# =>
#  "\e[32;44mIgnorance is \e[0m\n"
#  "\e[32;44mthe parent of \e[0m\n"
#  "\e[32;44mfear.\e[0m"
```

You can also call `wrap` directly on **Strings::Wrap**:

```ruby
Strings::Wrap.wrap(text, wrap_at)
```

## 3. Extending String class

Though it is highly discouraged to polute core Ruby classes, you can add the required methods to `String` class by using refinements.

For example, if you wish to only extend strings with `wrap` method do:

```ruby
module MyStringExt
  refine String do
    def wrap(*args)
      Strings.wrap(self, *args)
    end
  end
end
```

then `wrap` method will be available for any strings where refinement is applied:

```ruby
using MyStringExt

string.wrap(30)
```

However, if you want to include all the **Strings** methods:

```ruby
require 'strings/extensions'

using Strings::Extensions
```

## 4. Utilities

**Strings** aims to be fleaxible and allow you to choose only the utilities that you need. Currently you can choose from:

|  Utility     | Description | API docs |
| ------------ | ----------- | -------- |
| [strings-ansi](https://github.com/piotrmurach/strings-ansi) | Handle ANSI escape codes in strings. | [docs](http://www.rubydoc.info/gems/strings-ansi) |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/strings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/piotrmurach/verse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Strings project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/strings/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2017-2018 Piotr Murach. See LICENSE for further details.
