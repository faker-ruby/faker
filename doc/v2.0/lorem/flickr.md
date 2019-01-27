# Faker::Lorem::Flickr

Available since version 1.9.0.

```ruby
Faker::Lorem::Flickr.image #=> "http://loremflickr.com/300/300"

Faker::Lorem::Flickr.image("50x60") #=> "http://loremflickr.com/50/60"

Faker::Lorem::Flickr.image("50x60", ['sports']) #=> "http://loremflickr.com/50/60/sports"

Faker::Lorem::Flickr.image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/50/60/sports,fitness"

Faker::Lorem::Flickr.image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/50/60/sports,fitness/all"

Faker::Lorem::Flickr.grayscale_image #=> "http://loremflickr.com/g/300/300/all"

Faker::Lorem::Flickr.grayscale_image("50x60") #=> "http://loremflickr.com/g/50/60/all"

Faker::Lorem::Flickr.grayscale_image("50x60", ['sports']) #=> "http://loremflickr.com/g/50/60/sports"

Faker::Lorem::Flickr.grayscale_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/g/50/60/sports,fitness"

Faker::Lorem::Flickr.grayscale_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/g/50/60/sports,fitness/all"

Faker::Lorem::Flickr.pixelated_image #=> "http://loremflickr.com/p/300/300/all"

Faker::Lorem::Flickr.pixelated_image("50x60") #=> "http://loremflickr.com/p/50/60/all"

Faker::Lorem::Flickr.pixelated_image("50x60", ['sports']) #=> "http://loremflickr.com/p/50/60/sports"

Faker::Lorem::Flickr.pixelated_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/p/50/60/sports,fitness"

Faker::Lorem::Flickr.pixelated_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/p/50/60/sports,fitness/all"

Faker::Lorem::Flickr.colorized_image #=> "http://loremflickr.com/red/300/300/all"

Faker::Lorem::Flickr.colorized_image("50x60") #=> "http://loremflickr.com/red/50/60/all"

Faker::Lorem::Flickr.colorized_image("50x60", 'red') #=> "http://loremflickr.com/red/50/60/all"

Faker::Lorem::Flickr.colorized_image("50x60", 'red', ['sports']) #=> "http://loremflickr.com/red/50/60/sports"

Faker::Lorem::Flickr.colorized_image("50x60", 'red', ['sports', 'fitness']) #=> "http://loremflickr.com/red/50/60/sports,fitness"

Faker::Lorem::Flickr.colorized_image("50x60", 'red', ['sports', 'fitness'], true) #=> "http://loremflickr.com/red/50/60/sports,fitness/all"
```
