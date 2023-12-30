# Faker::Wine

Available since version 3.2.2.

```ruby
# Random wine varietal
Faker::Wine.varietal #=> "Pinot Noir"

# Random wine vintage (1990 - last year)
Faker::Wine.vintage #=> 2000

# Random wine appellation
Faker::Wine.appellation #=> "Pessac-Léognan"

# Random wine corporation
Faker::Wine.corporation #=> "Gallo"

# Random wine type
Faker::Wine.wine_type #=> "Red"

# Random wine brand
# Keyword arguments: real
Faker::Wine.brand #=> "Wisoky Family Estates"
Faker::Wine.brand(real: true) #=> "Caymus"

# Random wine bottle label
Faker::Wine.label #=> "2010 Wisoky Family Estates Cabernet Sauvignon"

# Random wine accolade/review
# Keyword arguments: bad
Faker::Wine.accolades #=> "delights the nose with cinnamon and fills your mouth with fresh raspberries that leaves you satisfied"
Faker::Wine.accolades(bad: true) #=> "unfortunately disappoints and has a sniff of rotten eggs and continues on with overripe prunes that offends the senses"

# Random wine score/rating
# Keyword arguments: with_review_org (priority), with_review_person
Faker::Wine.score #=> "85 points"
Faker::Wine.score(with_review_org: true) #=> "88 points, Wine Spectator"
Faker::Wine.score(with_review_person: true) #=> "88 points, Jim Laube"
```