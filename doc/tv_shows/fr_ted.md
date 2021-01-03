# Faker::TvShows::FrTed

A sanitised collection of quotes and characters from Fr Ted.

* Quotes: Up to 255 characters
* Short Quotes: Max 30 characters.
* Long Quotes: Min 256 characters

```ruby
Faker::TvShows::FrTed.character # => "Henry Sellers"
Faker::TvShows::FrTed.character # => "Father Noel Furlong"

Faker::TvShows::FrTed.quote # => "Oh yes, I'm afraid you messed with the wrong milkman, Father."
Faker::TvShows::FrTed.quote # => "They're even coming from Gdansk to see the film!"

Faker::TvShows::FrTed.short_quote # => "We have to lose that sax solo"
Faker::TvShows::FrTed.long_quote # => "You're right, Ted. I used to be happy enough with me old bike – I used to get a big buzz out of just going down to the shops on it, you know? But after a while... it just wasn't enough. I started going for bigger and bigger thrills... But I could give it up! Any time I wanted!"
```