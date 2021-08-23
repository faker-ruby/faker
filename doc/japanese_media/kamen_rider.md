# Faker::JapaneseMedia::KamenRider

```ruby
Faker::JapaneseMedia::KamenRider.kamen_rider #=> "Kamen Rider Revice"
Faker::JapaneseMedia::KamenRider.user #=> "Ikki Igarashi"
Faker::JapaneseMedia::KamenRider.series #=> "Kamen Rider Revice"
```

## Passing Eras

If you want Kamen Rider material from a specific era, you can either pass an
argument:

```ruby
Faker::JapaneseMedia::KamenRider.series(:reiwa)
=> "Kamen Rider Saber"
```

...or configure which eras you'd like to use on the class:

```ruby
Faker::JapaneseMedia::KamenRider.eras = [:heisei, :reiwa]
Faker::JapaneseMedia::KamenRider.series
=> "Kamen Rider Kiva"
```
