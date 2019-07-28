# Faker::File

Available since version 1.6.4.

```ruby
Faker::File.extension #=> "mp3"

Faker::File.mime_type #=> "application/pdf"

# Optional arguments: dir, name, extension, directory_separator
Faker::File.file_name(dir: 'path/to') #=> "path/to/something_random.jpg"
Faker::File.file_name(dir: 'foo/bar', name: 'baz') #=> "foo/bar/baz.zip"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'doc') #=> "foo/bar/baz.doc"
Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'mp3', directory_separator: '\\') #=> "foo\bar\baz.mp3"

# Optional arguments: segment_count, root, directory_separator
Faker::File.dir #=> "path/to/something_random"
Faker::File.dir(segment_count: 2) #=> "foo/bar"
Faker::File.dir(segment_count: 3, root: directory_separator: '/') #=> "/foo/bar/baz"
Faker::File.dir(segment_count: 3, root: nil, directory_separator: '\\') #=> "foo\bar\baz"
```
