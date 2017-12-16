We love pull requests. Here's a quick guide:

1. Fork the repo.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && bundle exec rake`

3. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!

4. Make the test pass.  Always use `sample`, `shuffle`, and `rand` from
the Base class (just like the rest of the code) rather than
`Array#sample`, `Array#shuffle` and `Kernel#rand` to preserve the
deterministic feature.

5. When adding a new class, add a new yaml file to
`lib/locales/en` rather than adding translations to
`lib/locales/en.yml`.  For example, if you add Faker::MyThing,
put your translations in `lib/locales/en/my_thing.yml`.  See [the locale
README](./lib/locales/en/README.md) for more info.

6. Methods with optional arguments should use keyword rather than positional 
arguments. An exception to this could be a method that takes only one 
optional argument, and it's unlikely that that method would ever take more
than one optional argument.

7. Push to your fork and submit a pull request.

Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`, `||` over `and`, `or`.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* Follow the conventions you see used in the source already.
