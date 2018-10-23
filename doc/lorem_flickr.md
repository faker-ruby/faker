# Faker::LoremFlickr

Available since version 1.9.0.
Since version 1.9.2 all methods have extra parameter ```randomize``` with default value true. It adds ```"?random=#{random_number}" ``` at the end of every URL preventing from displaying only one image all over the page.  

```ruby
Faker::LoremFlickr.image #=> "http://loremflickr.com/300/300/?random=#{random_number}"

Faker::LoremFlickr.image("50x60") #=> "http://loremflickr.com/50/60/?random=#{random_number}"

Faker::LoremFlickr.image("50x60", ['sports']) #=> "http://loremflickr.com/50/60/sports/?random=#{random_number}"

Faker::LoremFlickr.image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/50/60/sports,fitness/?random=#{random_number}"

Faker::LoremFlickr.image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/50/60/sports,fitness/all/?random=#{random_number}"

Faker::LoremFlickr.image("50x60", ['sports', 'fitness'], true, false) #=> "http://loremflickr.com/50/60/sports,fitness/all"

Faker::LoremFlickr.grayscale_image #=> "http://loremflickr.com/g/300/300/all/?random=#{random_number}"

Faker::LoremFlickr.grayscale_image("50x60") #=> "http://loremflickr.com/g/50/60/all/?random=#{random_number}"

Faker::LoremFlickr.grayscale_image("50x60", ['sports']) #=> "http://loremflickr.com/g/50/60/sports/?random=#{random_number}"

Faker::LoremFlickr.grayscale_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/g/50/60/sports,fitness/?random=#{random_number}"

Faker::LoremFlickr.grayscale_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/g/50/60/sports,fitness/all/?random=#{random_number}"

Faker::LoremFlickr.grayscale_image("50x60", ['sports', 'fitness'], true, false) #=> "http://loremflickr.com/g/50/60/sports,fitness/all"

Faker::LoremFlickr.pixelated_image #=> "http://loremflickr.com/p/300/300/all/?random=#{random_number}"

Faker::LoremFlickr.pixelated_image("50x60") #=> "http://loremflickr.com/p/50/60/all/?random=#{random_number}"

Faker::LoremFlickr.pixelated_image("50x60", ['sports']) #=> "http://loremflickr.com/p/50/60/sports/?random=#{random_number}"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/p/50/60/sports,fitness/?random=#{random_number}"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/p/50/60/sports,fitness/all/?random=#{random_number}"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness'], true, false) #=> "http://loremflickr.com/p/50/60/sports,fitness/all"

Faker::LoremFlickr.colorized_image #=> "http://loremflickr.com/red/300/300/all/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60") #=> "http://loremflickr.com/red/50/60/all/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60", 'red') #=> "http://loremflickr.com/red/50/60/all/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports']) #=> "http://loremflickr.com/red/50/60/sports/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports', 'fitness']) #=> "http://loremflickr.com/red/50/60/sports,fitness/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports', 'fitness'], true) #=> "http://loremflickr.com/red/50/60/sports,fitness/all/?random=#{random_number}"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports', 'fitness'], true, false) #=> "http://loremflickr.com/red/50/60/sports,fitness/all"
```
