# Faker::Placeholdit

```ruby
# Keyword arguments: size, format, background_color, text_color, text
Faker::Placeholdit.image #=> "https://via.placeholder.com/300x300.png"
Faker::Placeholdit.image(size: '50x50') #=> "https://via.placeholder.com/50x50.png"
Faker::Placeholdit.image(size: '50x50', format: 'jpg') #=> "https://via.placeholder.com/50x50.jpg"
Faker::Placeholdit.image(size: '50x50', format: 'gif', background_color: 'ffffff') #=> "https://via.placeholder.com/50x50.gif/ffffff"
Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: :random) #=> "https://via.placeholder.com/50x50.jpeg/39eba7"
Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: 'ffffff', text_color: '000') #=> "https://via.placeholder.com/50x50.jpeg/ffffff/000"
Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text') #=> "https://via.placeholder.com/50x50.jpg/ffffff/000?text=Some Custom Text"
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
