# Contributing to Faker

We are always happy to make improvements to Faker. There are many ways to contribute, from writing tutorials or blog posts, improving the documentation, submitting bug reports and feature requests or writing code which can be incorporated into Faker itself.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect by addressing your issue, assessing changes, and helping you finalize your pull requests.

## Reporting a bug

Have a fix for a problem you've been running into? Here's what you need to do:

- Fork this repo and clone your fork to somewhere on your machine.
- [Ensure that you have a working environment](#setting-up-your-environment).
- Read up on the [architecture of the gem](#architecture), [how to run tests](#running-the-tests), and [the code style we use in this project](#code-style).
- Cut a new branch and write a failing test for the feature or bugfix you plan on implementing.
- [Make sure your branch is well managed as you go along](#managing-your-branch).
- [Refrain from updating the changelog](#a-word-on-the-changelog).
- Push to your fork and submit a pull request.
- [Ensure that the test suite passes on GitHub Actions and make any necessary changes to your branch to bring it to green](#continuous-integration).

## What contributions we are looking for

faker-ruby already has lots of generators and locales. We appreciate any efforts made into updating the **existing** locales by:

- adding new translations
- updating the existing translations
- fixing any outdated/wrong translations

Although we maintain Faker in our free time, we try to respond to contributions in a timely manner. Once we look at your pull request, we may give you feedback. For instance, we may suggest some changes to make to your code to fit within the project style or discuss alternate ways of addressing the issue in question. Assuming we're happy with everything, we'll then bring your changes into main. Now you're a contributor!

## Setting up your environment

Faker requires Ruby version >= 2.7. After forking, and cloning the repo, navigate to the directory, and run:

```ruby
bundle install
```

Run `rake` to ensure the project is all setup. It runs the tests and rubocop. That means you're good to go!

## Architecture

This project follows the typical structure for a gem: code is located in `/lib` and tests are in `/test`. Generators
docs are available in the `/doc` folder.

## Running the tests

To run all of the tests, simply run:

```ruby
bundle exec rake test
```

## Code Style

We use [RuboCop](https://github.com/bbatsov/rubocop) as our static code analyzer.

Please follow these guidelines when adding new code:
* Use keywords arguments.
* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`, `||` over `and`, `or`.
* `MyClass.my_method(my_argument: my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* In general, follow the conventions you see being used in the source already.
* Rubocop errors must be resolved for the PR to be approved.
  * To fix all the offenses automatically with Rubocop's autocorrection tool, run `bundle exec rubocop -A`

There are a few ways to run RuboCop:

```ruby
`bundle exec rubocop` #-> to run Rubocop only
`bundle exec rake` #-> to run the test suite and rubocop after.
```

## Managing your branch

- Use well-crafted commit messages and Pull Requests descriptions, providing context if possible. Please use the Pull Request template when opening a new PR.
- When updating documentation, or README, [skip running CI](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs).
- Squash "WIP" commits and remove merge commits by rebasing your branch against main. We try to keep our commit history as clean as possible.
- To prevent pushing with test failures or Rubocop offenses, see [Setup a custom pre-push git hook](#setup-a-custom-pre-push-git-hook).

## Adding new generators/locales

The faker-ruby team has decided to stop accepting any new features, including generators and locales. Please see [What contributions we are looking for](#what-contributions-we-are-looking-for) for other ways you can help.

This allows us to focus on improving the performance and organization of the library. We appreciate your understanding and we are looking forward to get your help with making faker faster and easier to use.

### General Guidelines

Once the feature has met the requirements above, please review these guidelines before opening a PR:

- Avoid:
  - Hurtful language that can convey exclusionary behavior, such as racism, sexism, homophobia.
  - Graphically violent or harmful terms towards any living beings.
  - When possible, avoid the use of figurative language that can be interpreted as violent, such as hang, and hit.
  - Unnecessarily gendered language.
- Be considerate and mindful of others as much as possible.
- When adding new generators, limit the number of values per generator in the YML file. Adding a long YML file makes it harder to review your PR.
- Don't use `Array#sample`, `Array#shuffle` and `Kernel#rand` on your new generator if you want to randomly pick values. Instead, you should use the methods provided by the Base class: `sample`, `shuffle` and `rand`. The reason is that we want to preserve the deterministic feature of this gem.
- Make sure the generator doesn't exist already before opening a PR.
- Use the [PositionalGenerator](https://github.com/faker-ruby/faker/blob/main/lib/helpers/positional_generator.rb) helper when generating a list of generated values that fit a specific format, such as an ID, postal code, or phone number.
- Add a new YAML file to `lib/locales/en` rather than adding translations to the `lib/locales/en.yml` file. For example, if you add `Faker::MyThing`, put your translations in `lib/locales/en/my_thing.yml`.
  - When possible, consider adding the new YAML file inside a folder to keep things organized, for example: `lib/locales/en/quotes/parks_and_rec.yml`. See [the locale README](./lib/locales/en/README.md) for more info.

### Documentation

Add the new generator to the [Generators list in the README](./README.md#generators) so other people can find them.

#### YARD docs

Include [YARD] style docs for all methods that includes:
- A short description of what the method generates
- Descriptions for all params (`@param`)
- The return type (`@return`)
- At least one example of the output (`@example`)
- The version that the method was added (`@faker.version`)
  - Set as `next` for new methods or methods with new features

Here is an example:

```ruby
##
# Produces a random string of alphabetic characters, (no digits)
#
# @param char_count [Integer] The length of the string to generate
#
# @return [String]
#
# @example
#   Faker::Alphanumeric.alpha #=> "kgdpxlgwjirlqhwhrebvuomdcjjpeqlq"
#   Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"
#
# @faker.version next
def alpha(number: 32)
    # ...
end
```

[YARD]: (https://www.rubydoc.info/gems/yard/file/README.md)

## Removing generators

To remove a generator or any other public method, deprecate them first. We use the [`Gem::Deprecate`](https://ruby-doc.org/stdlib-3.1.0/libdoc/rubygems/rdoc/Gem/Deprecate.html).

To deprecate a method/argument, add `extend Gem::Deprecate` to the top of the class, and use the `deprecate` method. For example:

```rb
module Faker
  class LoremPixel < Base
    class << self
      extend Gem::Deprecate
      def image
      ...
      end
      deprecate :image, 'Faker::LoremFlickr.image', 2022, 12
    end
  end
end
```

## Deprecating Generators

To deprecate entire generators and provide backwards compatibility when it's possible, use this custom [Faker::Deprecator](https://github.com/faker-ruby/faker/blob/main/lib/helpers/deprecator.rb) helper module. 
It's useful for renaming a generator, for example, renaming `IDNumber` to `IdNumber`. Here's how to use it:

- include the `Faker::Deprecator` module after the class definition.
- add the `deprecate_generator` method with the old and new class names as arguments.

```rb 
module Faker
  class IdNumber < Base
    ## methods
  end

  include Faker::Deprecator
  deprecate_generator('IDNumber', IdNumber)
end
```

`Faker::IDNumber` is now deprecated. Despite the deprecation, it will still be available with logged warnings and will be removed in the next major release.

```rb
Faker::IDNumber.valid #=> "552-56-3593"

## Deprecation warning
DEPRECATION WARNING: Faker::IDNumber is deprecated. Use Faker::IdNumber instead.
```

We recommend adding tests for both the deprecated and new generators to ensure that the deprecation process is working as expected.
Check out this [PR](https://github.com/faker-ruby/faker/pull/2856) for reference.


## YAML files

Please use dash syntax for YAML arrays. The dash syntax facilitates code reviews by making it easier to see what items were added or removed from the lists.

Here is an example:

```Yaml
# this is preferred
a_things:
  - small_thing
  - big_thing
  - other_thing

# instead of these
b_things: [small_thing, big_thing, other_thing]
c_things: [
  small_thing,
  big_thing,
  other_thing,
]
```

When in doubt, run `bundle exec rake reformat_yaml['lib/path/to/file.yml']` to reformat your YAML file.

## Tips

* Use the `rake console` task to start a session with Faker loaded.
* Use `bundle exec yard server -r` to launch the YARD Doc server.

## A word on the Changelog

You may also notice that we have a changelog in the form of CHANGELOG.md. You may be tempted to include changes to this in your branch, but don't worry about this — we'll take care of it!

## Continuous integration

GitHub Actions will kick in after you push up a branch or open a PR. It takes a few minutes to run a complete build, which you are free to monitor as it progresses. First-time contributors may need to wait until a maintainer approves the build.

What happens if the build fails in some way? Don't fear! Click on a failed job and scroll through its output to determine the cause of the failure. You'll want to make changes to your branch and push them up until the entire build is green. It may take a bit of time, but overall it is worth it and it helps us immensely!

## Setup a custom pre-push git hook

There is a custom git hooks pre-push file. Before the push occurs, it runs the tests and Rubocop. If there are any tests failures, or Rubocop offenses, the push is aborted.


To set up:
- Copy the file `pre-push.sample` located in the `custom-hooks` folder.
- Paste it in your `.git/hooks` folder without the `.sample` extension.
- Run `chmod +x .git/hooks/pre-push` to make the file executable (not needed for Windows users).

To skip this hook for any push, add `--no-verify` to the end of the command:

`git push --no-verify <remote_name> <branch_name>`

To disable this hook completely: remove the file `.git/hooks/pre-push`.
