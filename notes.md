# Lazy Loading Faker

## Ideas
- lazy load classes on const_missing
- could we use autoload? benchmark load time and exec time
- could we use zeitwerk? same thing
- do we always need a file `faker/fantasy.rb`? Maybe zeitwerk helps here?
- how about the LazyLoad backend for i18n? That could be a future improvement.

## How to test

```
$ LAZY_LOAD=1 bundle exec rake console
#=> lazy load...

irb(main):001> Faker::Fantasy::Tolkien.character 
#=> "Argeleb"

irb(main):002> Faker::Fantasy::Tolkien.character 
#=> "Iago Grubb"

```

## Before changes

benchmarking loading

ruby 3.4.0dev (2024-12-25 master f450108330) +PRISM [x86_64-linux]
Warming up --------------------------------------
        Loading Time     1.000 i/100ms
Calculating -------------------------------------
        Loading Time      4.821 (± 0.0%) i/s  (207.41 ms/i) -     25.000 in   5.185760s


## After Changes (without fixing generators yet, so they will fail)
```
$ LAZY_LOAD=1 ruby benchmark_load.rb 

benchmarking loading

ruby 3.4.0dev (2024-12-25 master f450108330) +PRISM [x86_64-linux]
Warming up --------------------------------------
        Loading Time     1.000 i/100ms
Calculating -------------------------------------
        Loading Time     13.814 (± 7.2%) i/s   (72.39 ms/i) -     69.000 in   5.014000s

```

Lazy loading would make loading 187% faster, but would have an impact the first time the 
generator is used/loaded.
