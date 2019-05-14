<div align="center">
  <a href="https://piotrmurach.github.io/tty" target="_blank"><img width="130" src="https://cdn.rawgit.com/piotrmurach/tty/master/images/tty.png" alt="tty logo" /></a>
</div>

# TTY::Tree [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-tree.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-tree.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/q3s4gagj8xnospw4?svg=true)][appveyor]
[![Code Climate](https://codeclimate.com/github/piotrmurach/tty-tree/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-tree/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-tree.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-tree
[travis]: http://travis-ci.org/piotrmurach/tty-tree
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-tree
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-tree
[coverage]: https://coveralls.io/github/piotrmurach/tty-tree
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-tree

> Print directory or structured data in a tree like format.

**TTY::Prompt** provides independent directory or hash data rendering component for [TTY](https://github.com/piotrmurach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-tree

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1 new](#21-new)
    * [2.1.1 level](#211-level)
    * [2.1.2 file_limit](#212-level)
    * [2.1.3 show_hidden](#213-show_hidden)
    * [2.1.4 only_dirs](#214-only_dirs)
  * [2.2 render](#22-render)
    * [2.2.1 indent](#221-indent)

## 1. Usage

`TTY::Tree` accepts as input a directory path:

```ruby
tree = TTY::Tree.new(Dir.pwd)
tree = TTY::Tree.new('dir-name')
```

or can be given as its input a `hash` data structure with keys representing directories and values as `array`s representing directory contents:

```ruby
data = {
  dir1: [
    'config.dat',
    { dir2: [
      { dir3: [ 'file3-1.txt' ] },
      'file2-1.txt'
      ]
    },
    'file1-1.txt',
    'file1-2.txt'
  ]
}

tree = TTY::Tree.new(data)
```

You can also construct tree with a DSL:

```ruby
tree = TTY::Tree.new do
  node 'dir1' do
    node 'config.dat'
    node 'dir2' do
      node 'dir3' do
        leaf 'file3-1.txt'
      end
      leaf 'file2-1.txt'
    end
    node 'file1-1.txt'
    leaf 'file1-2.txt'
  end
end
```

The `TTY::Tree` can print the content in various formats. By default, a directory format is used by invoking `render`:

```ruby
puts tree.render
# =>
# dir1
# ├── config.dat
# ├── dir2,
# │   ├── dir3\n",
# │   │   └── file3-1.txt\n",
# │   └── file2-1.txt\n",
# ├── file1-1.txt\n",
# └── file1-2.txt\n",
```

The `render` call returns a string and leaves it up to api consumer how to handle the tree like output.

## 2. Interface

### 2.1 new

In order to create `TTY::Tree` you need to provide either a path to directory which can be a String, Pathname or Dir:

```ruby
tree = TTY::Tree.new(Dir.pwd)
tree = TTY::Tree.new('dir-name')
tree = TTY::Tree.new(Pathname.pwd)
```

or hash data structure:

```ruby
data = {
  dir1: [
    'config.dat',
    ...
  ]
}

tree = TTY::Tree.new(data)
```

As as shortcut notation you can call `[]` like so:

```ruby
tree = TTY::Tree[Dir.pwd]
```

You can also use DSL to build tree by using `node` & `leaf`:

```ruby
tree = TTY::Tree.new do
  node 'dir1' do
    node 'config.dat'
    node 'dir2' do
      node 'dir3' do
        leaf 'file3-1.txt'
      end
      leaf 'file2-1.txt'
    end
    node 'file1-1.txt'
    leaf 'file1-2.txt'
  end
end
```

#### 2.1.1 level

The maximum level of depth for this tree when parsing directory. The initial directory is treated as index `0`.

```ruby
tree = TTY::Tree.new('dir-name', level: 2)
# => parse directories as deep as 2 levels
```

#### 2.1.2 file_limit

Prevent `TTY::Tree` descending directories more than `#` entries:

```ruby
tree = TTY::Tree.new('dir-name', file_limit: 2)
```

#### 2.1.3 show_hidden

In order to for `TTY::Tree` to include hidden files in its output use `:show_hidden` option like so:

```ruby
tree = TTY::Tree.new('dir-name', show_hidden: true)
```

#### 2.1.4 only_dirs

To only display directory entries in the output use `:only_dirs` option:

```ruby
tree = TTY::Tree.new('dir-name', only_dirs: true)
```

Listing directories does not inlucde hidden ones. If you wish to show hidden directories as well do:

```ruby
tree = TTY::Tree.new('dir-name', only_dirs: true, show_hidden: true)
```

### 2.2 render

By deafult content is printed using `TTY::PathRenderer`.

If you prefer a numeric notation of nested content you can use `TTY::NumberRenderer` to enumerates each nested node like so:

```ruby
puts tree.render(as: :number)
# =>
# dir1\n",
# 1.1 config.dat\n",
# 1.2 dir2\n",
#     2.3 dir3\n",
#         3.4 file3-1.txt\n",
#     2.5 file2-1.txt\n",
# 1.6 file1-1.txt\n",
# 1.7 file1-2.txt\n",
```

#### 2.2.1 indent

The number of spaces to use when indenting nested directories. By default `4` spaces are used.

```ruby
tree.render(as: :dir, indent: 2)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-tree. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Copyright

Copyright (c) 2017-2018 Piotr Murach. See LICENSE for further details.
