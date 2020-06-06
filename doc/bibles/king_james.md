# Faker::Bibles::KingJames

```ruby
# List of books
Faker::Bibles::KingJames::BOOKS #=> ["genesis", "exodus", "leviticus", "numbers", "deuteronomy", "joshua", "judges", "ruth", "one_samuel", "two_samuel", "one_kings", "two_kings", "one_chronicles", "two_chronicles", "ezra", "nehemiah", "esther", "job", "psalms", "proverbs", "ecclesiastes", "song_of_solomon", "isaiah", "jeremiah", "lamentations", "ezekiel", "daniel", "hosea", "joel", "amos", "obadiah", "jonah", "micah", "nahum", "habakkuk", "zephaniah", "haggai", "zechariah", "malachi", "matthew", "mark", "luke", "john", "acts", "romans", "one_corinthians", "two_corinthians", "galatians", "ephesians", "philippians", "colossians", "one_thessalonians", "two_thessalonians", "one_timothy", "two_timothy", "titus", "philemon", "hebrews", "james", "one_peter", "two_peter", "one_john", "two_john", "three_john", "jude", "revelation"]

# Random book name (generated from BOOKS)
Faker::Bibles::KingJames.book #=> "two_thessalonians"

# Random verse. Takes three optional arguments:
#   prefix (bool): include/exclude prefix (default: true)
#   emphasis (bool): include/exclude markdown-compatible emphasis (italicized in original publication) (default: false)
#   books (string/array): which book(s) to use to select verse. (default: BOOKS)
Faker::Bibles::KingJames.verse #=> "Jude 1:1 Jude, the servant of Jesus Christ, and brother of James, to them that are sanctified by God the Father, and preserved in Jesus Christ, and called:"


# Random verse from a given book
Faker::Bibles::KingJames.verse(books: 'genesis') #=> "Genesis 5:6 And Seth lived an hundred and five years, and begat Enos:"

# Alias for random verse from a given book (replace verse with book name). Also takes prefix or emphasis args as shown above
Faker::Bibles::KingJames.genesis #=> "Genesis 13:17 Arise, walk through the land in the length of it and in the breadth of it; for I will give it unto thee."

# Random verse from array of books
Faker::Bibles::KingJames.verse(books: %w[genesis exodus]) #=> "Exodus 34:2 And be ready in the morning, and come up in the morning unto mount Sinai, and present thyself there to me in the top of the mount."
```
