# Faker::Avatar

```ruby
Faker::Avatar.image #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"

Faker::Avatar.image(slug: "my-own-slug") #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"

Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1") #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
```
