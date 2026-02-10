# Lazy load experiment results

- Git Branch: [sb-ta/lazy-load-experiment](https://github.com/faker-ruby/faker/compare/main...sb-ta/lazy-load-experiment)
- Date: February 10th, 2026
- Owner(s): Stefanni Brasil and Thiago Araujo

## Impact

Using `const_missing` to lazy load generators was an idea from talking with Jeremy Evans, who kindly responded our questions about improving faker's performance.

### Changes needed

#### Namespace changes

A few generators had namespaces that didn't match their file name, and most of them were manageable, but two needed to be renamed:

- `Faker::Music` -> `Faker::Song`. `Faker::Music` is a nested namespace.
- `Faker::Internet::HTTP` -> `Faker::HTTP`. `Faker::Internet` is another generator.

Considering that only two generators would be renamed, it wouldn't be a huge burden for users to use this approach.

#### File location changes

To prevent other generators from erroring out due to namespace clashing, some generators have to be moved around (ex. `Faker::Quote` was moved from `/faker/quotes/quote` to `faker/default/quote`). Users can still use the generators as before, their namespaces didn't change.

### Benefits

- no additional dependencies needed
- code is extremely faster
- after changing these two generators, which would be breaking changes, we can enable this as an opt-in configuration

## Results

profiler:

- [bundle exec vernier run -- ruby -e "require 'faker'" LAZY_LOAD=1](https://share.firefox.dev/3ZuCP55)
- [bundle exec vernier run --interval 100 --allocation-interval 10 -- ruby -e "require 'faker'; Faker::Internet.email" LAZY_LOAD=1](https://share.firefox.dev/4601PoA)

benchmarks (Machine specs: Apple M1 Pro 16GB memory on MacOS Sequoia 15.7.3.)

```sh
benchmark % ruby require.rb
took 250.0249999575317ms to load
```

```sh
benchmark % ruby load.rb
ruby 3.3.10 (2025-10-23 revision 343ea05002) [arm64-darwin24]
Warming up --------------------------------------
             require     1.000 i/100ms
            lazyload     1.000 i/100ms
Calculating -------------------------------------
             require      5.874 (± 0.0%) i/s  (170.25 ms/i) -     30.000 in   5.115652s
            lazyload     12.207 (± 8.2%) i/s   (81.92 ms/i) -     61.000 in   5.007059s

Comparison:
             require:        5.9 i/s
            lazyload:       12.2 i/s - 2.08x  faster
```

## Artifacts

Constants were configured to be lazy loaded using this script:

```ruby
# lazy_load.rb

CATEGORIES = {
  Blockchain: 'blockchain',
  Books: 'books',
  Creature: 'creature',
  Default: 'default',
  Fantasy: 'fantasy',
  Games: 'games',
  JapaneseMedia: 'japanese_media',
  Locations: 'locations',
  Movies: 'movies',
  Music: 'music',
  Quotes: 'quotes',
  Religion: 'religion',
  Sports: 'sports',
  Travel: 'travel',
  TvShows: 'tv_shows'
}.freeze

def template(key)
"# frozen_string_literal: true

module Faker
  class #{key}
    if ENV['LAZY_LOAD'] == '1'
      Faker.lazy_load(self)
    end
  end
end"
end

CATEGORIES.each do |key, value|
  File.write(File.join('lib', 'faker', "#{value}.rb"), template(key))
end
```
