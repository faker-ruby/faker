# Faker::Placeholdit

```ruby
Faker::Placeholdit.image #=> "http://placehold.it/300x300.png/000"

Faker::Placeholdit.image("50x50") #=> "http://placehold.it/50x50.png/000"

Faker::Placeholdit.image("50x50", 'jpg') #=> "http://placehold.it/50x50.jpg/000"

Faker::Placeholdit.image("50x50", 'gif', 'ffffff') #=> "http://placehold.it/50x50.gif/ffffff"

Faker::Placeholdit.image("50x50", 'jpeg', :random) #=> "http://placehold.it/50x50.jpeg/39eba7"

Faker::Placeholdit.image("50x50", 'jpeg', 'ffffff', '000') #=> "http://placehold.it/50x50.jpeg/ffffff/000"

Faker::Placeholdit.image("50x50", 'jpeg', :random, :random) #=> "http://placehold.it/50x50.jpeg/d39e44/888ba7"

Faker::Placeholdit.image("50x50", 'jpg', 'ffffff', '000', 'Some Custom Text') #=> "http://placehold.it/50x50.jpg/ffffff/000?text='Some Custom Text'"
```
