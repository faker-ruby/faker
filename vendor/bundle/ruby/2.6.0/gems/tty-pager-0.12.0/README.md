<div align="center">
  <a href="https://piotrmurach.github.io/tty" target="_blank"><img width="130" src="https://cdn.rawgit.com/piotrmurach/tty/master/images/tty.png" alt="tty logo" /></a>
</div>

# TTY::Pager [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-pager.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-pager.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/3auc1vi3mk5puqai?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/636da0d02231b7f3e50f/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-pager/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-pager.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-pager
[travis]: http://travis-ci.org/piotrmurach/tty-pager
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-pager
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-pager/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/tty-pager
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-pager

> Terminal output paging in a cross-platform way supporting all major ruby interpreters.

**TTY::Pager** provides independent terminal output paging component for [TTY](https://github.com/piotrmurach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

    gem 'tty-pager'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-pager


## Overview

The **TTY::Pager** on initialization will choose the best available pager out of `SystemPager`, `BasicPager` or `NullPager`. If paging is disabled then a `NullPager` is used, which either returns text as is or simply prints it out to stdout on tty devices. Otherwise a check is performed to find paging command to page text with `SystemPager`. However, if no paging command is found, a `BasicPager` is used which is a pure Ruby implementation that is guaranteed to work with any ruby interpreter and any platform.

## 1. Usage

In order to let **TTY::Pager** pick the best paging mechanism automatically do:

```ruby
pager = TTY::Pager.new
```

Then to perform actual content pagination invoke `page` method with the content to paginate as the argument:

```ruby
pager.page("Very long text...")
```

If you want to use specific pager you can do so by invoking it directly:

```ruby
pager = TTY::Pager::BasicPager.new
```

## 2. Interface

### :enabled

If you want to disable the pager pass the `:enabled` option set to `false`:

```ruby
pager = TTY::Pager.new(enabled: false)
```

### :width

The `BasicPager` allows to wrap content at given width:

```ruby
pager = TTY::Pager.new(width: 80)
pager = TTY::Pager::BasicPager.new(width: 80)
```

### :prompt

For the `BasicPager` you can pass a `:prompt` option to change the page break text:

```ruby
prompt = -> (page_num) { output.puts "Page -#{page_num}- Press enter to continue" }
pager = TTY::Pager::BasicPager.new(prompt: prompt)
```

### :command

You can force `SystemPager` to always use a specific paging tool(s) by passing the `:command` option:

```ruby
TTY::Pager.new(command: 'less -R')
TTY::Pager::SystemPager.new(command: 'less -R')
```

You also specify an array of pagers to use:

```ruby
pager = TTY::Pager.new(command: ['less -r', 'more -r'])
```

### PAGER

By default the `SystemPager` will check the `PAGER` environment variable, if not set it will try one of the `less`, `more`, `cat`, `pager`. Therefore, if you wish to set your preferred pager you can either set up your shell like so:

```bash
PAGER=less
export PAGER
```

or set `PAGER` in Ruby script:

```ruby
ENV['PAGER']='less'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-pager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/piotrmurach/tty-pager/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
