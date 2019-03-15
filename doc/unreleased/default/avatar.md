# Faker::Avatar

```ruby
Faker::Avatar.image #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"

Faker::Avatar.image("my-own-slug") #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"

Faker::Avatar.image("my-own-slug", "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"

Faker::Avatar.image("my-own-slug", "50x50", "jpg") #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"

Faker::Avatar.image("my-own-slug", "50x50", "bmp") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"

Faker::Avatar.image("my-own-slug", "50x50", "bmp", "set1", "bg1") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
```
