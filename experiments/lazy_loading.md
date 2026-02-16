# Lazy load experiment results

Branch: sb-ta/lazy-load-experiment
Date: February 10th, 2026
Owner(s): Stefanni Brasil and Thiago Araujo

## Impact

Using `const_missing` to lazy load generators was an idea from talking with Jeremy Evans, who kindly responded our questions about improving faker's performance.

### Changes needed

Would require loading `faker/music` and `faker/internet` first, before the nested namespaces such as `Faker::Music::BossaNova`,
as they inherit from class `Music`.

#### File location changes

To prevent other generators from erroring out due to namespace clashing, some generators have to be moved around (ex. `Faker::Quote` was moved from `/faker/quotes/quote` to `faker/default/quote`). Users can still use the generators as before, their namespaces didn't change.

### Benefits

- no additional dependencies needed
- code is extremely faster
- we can enable this as an opt-in configuration

## Results

Machine specs: Apple M1 Pro 16GB memory on MacOS Sequoia 15.7.3..

profiler:

[LAZY_LOAD=1 bundle exec vernier run -- ruby -e "require 'faker'"](https://share.firefox.dev/46biNAs)
[bundle exec vernier run -- ruby -e "require 'faker'"](https://share.firefox.dev/4ams9vM)

benchmark:

```sh
benchmark % ruby load.rb
ruby 3.3.10 (2025-10-23 revision 343ea05002) [arm64-darwin24]
Warming up --------------------------------------
             require     1.000 i/100ms
            lazyload     1.000 i/100ms
Calculating -------------------------------------
             require      4.698 (± 0.0%) i/s  (212.88 ms/i) -     24.000 in   5.133782s
            lazyload      9.751 (± 0.0%) i/s  (102.55 ms/i) -     49.000 in   5.032161s

Comparison:
             require:        4.7 i/s
            lazyload:        9.8 i/s - 2.08x  faster
```

## Artifacts

### Scripts

Constants were registered using this script:

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
