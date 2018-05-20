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
a test! We use [Minitest](https://github.com/seattlerb/minitest) in this project. If you're not familiar with Minitest and are comfortable with Rspec, please ask a collaborator to review your PR.

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

8. If you need to update your branch with master before merging, you should follow these steps:
```ruby
# GitHub ID: vbrazo
# Branch: fixes/fix-warnings

git remote -v # Show all Remote Branches
git remote add faker git@github.com:stympy/faker.git # if you don't have the faker remote address yet
git checkout master # switch to the master branch
git reset --hard HEAD~50 # because your branch master might have things that don't need anymore
git pull faker master # now you're good to go
git push -f [your remote address] master # now your master is updated
# in this case it would be git push -f vbrazo master

# if you want to update your fixes/fix-warnings branch after updating your master:
git checkout fixes/fix-warnings
git merge --no-ff master
git status # to see what files have conflicts. Fix the conflicts and commit them
git add .
git commit -m 'Fix merge conflicts with master'
git push -f [your remote address] fixes/fix-warnings
# in this case it would be git push -f vbrazo fixes/fix-warnings
```

8. Push to your fork and submit a pull request.

Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`, `||` over `and`, `or`.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* Follow the conventions you see used in the source already.
