# Faker::Placeholdit

```ruby
Faker::Placeholdit.image #=> "https://placehold.it/300x300.png"

Faker::Placeholdit.image("50x50") #=> "https://placehold.it/50x50.png"

Faker::Placeholdit.image("50x50", 'jpg') #=> "https://placehold.it/50x50.jpg"

Faker::Placeholdit.image("50x50", 'gif', 'ffffff') #=> "https://placehold.it/50x50.gif/ffffff"

Faker::Placeholdit.image("50x50", 'jpeg', :random) #=> "https://placehold.it/50x50.jpeg/39eba7"

Faker::Placeholdit.image("50x50", 'jpeg', 'ffffff', '000') #=> "https://placehold.it/50x50.jpeg/ffffff/000"

Faker::Placeholdit.image("50x50", 'jpeg', :random, :random) #=> "https://placehold.it/50x50.jpeg/d39e44/888ba7"

Faker::Placeholdit.image("50x50", 'jpg', 'ffffff', '000', 'Some Custom Text') #=> "https://placehold.it/50x50.jpg/ffffff/000?text=Some Custom Text"
```
