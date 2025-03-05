# Faker::Blockchain::Coin

```ruby
Faker::Blockchain::Coin.coin_name #=> "Bitcoin"

Faker::Blockchain::Coin.acronym #=> "BTC"

Faker::Blockchain::Coin.url_logo #=> "https://i.imgur.com/EFz61Ei.png"

# rename these to Coin.array and hash, or just pass the format in a single one?
Faker::Blockchain::Coin.coin_array #=> ["Dash", "DASH", "https://i.imgur.com/2uX91cb.png"]

Faker::Blockchain::Coin.coin_hash {:name=>"Ethereum", :acronym=>"ETH", :url_logo=>"https://i.imgur.com/uOPFCXj.png"}
```
