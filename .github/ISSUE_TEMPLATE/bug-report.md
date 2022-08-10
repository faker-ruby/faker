---
name: Bug Report
about: Create a bug report
title: "Issue title goes here"
labels: "🐞 Issue: Bug"
assignees: ''

---

## Describe the bug
A clear and concise description of what the bug is.

## To Reproduce
Describe a way to reproduce your bug. To get the Faker version, run `FAKER::VERSION`.

Use the reproduction script below to reproduce the issue:

```
# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem "minitest"
end

require "minitest/autorun"

class BugTest < Minitest::Test
  def test_faker
    # CHANGEME - Reproduce the issue here. Here's an example:
    @tester = Faker::TvShows::SiliconValley
    refute_empty @tester.company
    assert @tester.company == "Intersite"
  end
end

```

## Expected behavior
A clear and concise description of what you expected to happen.

## Additional context
Add any other additional information about the problem here.
