# Autoload with zeitwerk experiment results

Branch: [sb-autoload-zeitwerk-experiment-3207](https://github.com/faker-ruby/faker/compare/sb-autoload-zeitwerk-experiment-3207?expand=1)
Date: February 17th, 2026
Owner(s): Stefanni Brasil and Thiago Araujo

## Impact

We want to compare improving faker's performance by lazy loading the generators or autoloading with Zeitwerk. This document shows the benchmarks, and other changes needed to configure Zeitwerk.

With the experiments documented, we can assess the pros and cons of maintainability, fewer breaking changes, easier adoption factors as guiding points for choosing the strategy we will move forward.

### Changes needed

- load and require generators in the correct order

Similarly to the [lazy load experiment](./lazy_load.md), it would be required to load `faker/music` and `faker/internet` first, before the nested namespaces such as `Faker::Music::BossaNova`, as they inherit from class `Music`, for example.

- added a runtime dependency for the library

#### File location changes

To prevent other generators from erroring out due to namespace clashing, some generators have to be moved around (ex. `Faker::Quote` was moved from `/faker/quotes/quote` to `faker/default/quote`). Users can still use the generators as before, their namespaces didn't change.

### Benefits

- less code changes than lazy loading, and lots of customization options available (i.e., eager loading)
- no breaking changes
- code is extremely faster, but a bit slower than lazy loading
- we can enable this as an opt-in configuration

## Results

Machine specs: Apple M1 Pro 16GB memory on MacOS Sequoia 15.7.3.

profiler:

[AUTOLOAD=1 bundle exec vernier run -- ruby -e "require 'faker'"](https://share.firefox.dev/4aAJJee)
[bundle exec vernier run -- ruby -e "require 'faker'"](https://share.firefox.dev/4bWViih)

benchmark:

```sh
benchmark % ruby load.rb
ruby 3.3.10 (2025-10-23 revision 343ea05002) [arm64-darwin24]
Warming up --------------------------------------
             require     1.000 i/100ms
            autoload     1.000 i/100ms
Calculating -------------------------------------
             require      6.026 (± 0.0%) i/s  (165.96 ms/i) -     31.000 in   5.145463s
            autoload     11.730 (± 0.0%) i/s   (85.25 ms/i) -     59.000 in   5.032426s

Comparison:
             require:        6.0 i/s
            autoload:       11.7 i/s - 1.95x  faster
```
