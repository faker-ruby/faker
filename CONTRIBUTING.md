We love pull requests. Here's a quick guide:

1. Fork the repo.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && bundle exec rake`

3. We are using [Rubocop](https://github.com/bbatsov/rubocop) because we love static code analyzers. 

Ways to run Rubocop:
- `bundle exec rubocop`
- `bundle exec rake` would run the test suite and after that it runs the Ruby static code analyzer.
If you want to try to fix the rubocop violations, you should run `bundle exec rubocop -a` to try to autocorrect the issues. If this last command doesn't solve the violations, you'll need to google.

If you are not familiar with Rubocop, spend some time studying their page and a few study cases on the internet.

4. Please add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test! We use [Minitest](https://github.com/seattlerb/minitest) in this project. If you're not familiar with Minitest and are comfortable with Rspec, please ask a contributor/collaborator to review your PR.

5. Make the test pass. Always use `sample`, `shuffle`, and `rand` from
the Base class (just like the rest of the code) rather than
`Array#sample`, `Array#shuffle` and `Kernel#rand` to preserve the
deterministic feature.

6. When adding a new class, add a new yaml file to
`lib/locales/en` rather than adding translations to
`lib/locales/en.yml`.  For example, if you add Faker::MyThing,
put your translations in `lib/locales/en/my_thing.yml`.  See [the locale
README](./lib/locales/en/README.md) for more info.

7. Methods with optional arguments should use keyword rather than positional 
arguments. An exception to this could be a method that takes only one 
optional argument, and it's unlikely that that method would ever take more
than one optional argument.

8. Push to your fork and submit a pull request.

### Github Flow

For those of you with commit access, please check out Scott Chacon's blog post about [github flow](http://scottchacon.com/2011/08/31/github-flow.html)

> * Anything in the master branch is deployable
> * To work on something new, create a descriptively named branch off of master (ie: new-oauth2-scopes)
> * Commit to that branch locally and regularly push your work to the same named branch on the server
> * When you need feedback or help, or you think the branch is ready for merging, open a pull request
> * After someone else has reviewed and signed off on the feature, you can merge it into master

Syntax/Good practices:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`, `||` over `and`, `or`.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* Follow the conventions you see used in the source already.
