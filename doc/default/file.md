# Faker::File

Available since version 1.6.4.

```ruby
Faker::File.extension #=> "mp3"

# Keyword arguments: media_type
Faker::File.mime_type #=> "application/pdf"
Faker::File.mime_type(media_type: 'image') #=> "image/png"

# Keyword arguments: dir, name, extension, directory_separator
Faker::File.file_name(dir: 'path/to') #=> "path/to/something_random.jpg"
Faker::File.file_name(dir: 'foo/bar', name: 'baz') #=> "foo/bar/baz.zip"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'doc') #=> "foo/bar/baz.doc"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'mp3', directory_separator: '\\') #=> "foo/bar\\baz.mp3"

# Keyword arguments: segment_count, root, directory_separator
Faker::File.dir #=> "et_error/sint_voluptas/quas_veritatis"
Faker::File.dir(segment_count: 2) #=> "ea-suscipit/ut-deleniti"
Faker::File.dir(segment_count: 3, root: nil, directory_separator: '/') #=> "est_porro/fugit_eveniet/incidunt-autem"
Faker::File.dir(segment_count: 3, root: nil, directory_separator: '\\') #=> "aut-ullam\\quia_quisquam\\ut-eos"
```
