# Faker::Placeholdit

```ruby
Faker::Placeholdit.image #=> "https://placehold.it/300x300.png"

Faker::Placeholdit.image(size: '50x50') #=> "https://placehold.it/50x50.png"

Faker::Placeholdit.image(size: '50x50', format: 'jpg') #=> "https://placehold.it/50x50.jpg"

Faker::Placeholdit.image(size: '50x50', format: 'gif', background_color: 'ffffff') #=> "https://placehold.it/50x50.gif/ffffff"

Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: :random) #=> "https://placehold.it/50x50.jpeg/39eba7"

Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: 'ffffff', text_color: '000') #=> "https://placehold.it/50x50.jpeg/ffffff/000"

Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: :random, :random) #=> "https://placehold.it/50x50.jpeg/d39e44/888ba7"

Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text') #=> "https://placehold.it/50x50.jpg/ffffff/000?text=Some Custom Text"
```

## Tips

If you want to have this file downloaded, like in your tests, you could use this following piece of code:

```ruby
def image_file(size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
  file = Tempfile.new("faker_placeholdit")
  file.binmode
  file << Net::HTTP.get(URI(Faker::Placeholdit.image(size: size, format: format, background_color: background_color, text_color: text_color, text: text)))
  file.close

  ::File.new(file.path)
end
```
