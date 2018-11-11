# Faker::File

Available since version 1.6.4.

```ruby
Faker::File.extension #=> "mp3"

Faker::File.mime_type #=> "application/pdf"

# Optional arguments: dir, name, extension, directory_separator
Faker::File.file_name('path/to') #=> "path/to/something_random.jpg"
Faker::File.file_name('foo/bar', 'baz') #=> "foo/bar/baz.zip"
Faker::File.file_name('foo/bar', 'baz', 'doc') #=> "foo/bar/baz.doc"
Faker::File.file_name('foo/bar', 'baz', 'mp3', '\') #=> "foo\bar\baz.mp3"
```
