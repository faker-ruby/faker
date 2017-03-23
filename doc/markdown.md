# Faker::Markdown

Generates markdown formatting with Lorem Ipsum text

```ruby
#Headers - generates a random header format
Faker::Markdown.headers #=> "##### Autem"

# Emphasis - generates random emphasis formatting on a random word in two sentences
Faker::Markdown.emphasis #=> "Incidunt atque quis repellat id impedit.  Quas numquam quod incidunt dicta non. Blanditiis delectus laudantium atque reiciendis qui."

# Ordered List - generates an ordered list of items between 1 and 10 randomly
Faker::Markdown.ordered_list #=> "1. Qui reiciendis non consequatur atque.\n2. Quo doloremque veritatis tempora aut.\n3. Aspernatur.\n4. Ea ab.\n5. Qui.\n6. Sit pariatur nemo eveniet.\n7. Molestiae aut.\n8. Nihil molestias iure placeat.\n9. Dolore autem quisquam."

# Unordered List - generates an unordered list of items between 1 and 10 randomly
Faker::Markdown.unordered_list #=> "* Voluptatum aliquid tempora molestiae facilis non sed.\n* Nostrum omnis iste impedit voluptatum dolor.\n* Esse quidem et facere."

# Inline code - generates an inline code snippet between two sentences
Faker::Markdown.inline_code #=> "Aut eos quis suscipit. `Dignissimos voluptatem expedita qui.` Quo doloremque veritatis tempora aut."

# Code Block - generates a code block formatted in ruby
Faker::Markdown.block_code #=> "```ruby\nEos quasi qui.\n```"

# Table - generates a 3x3 table
Faker::Markdown.table #=> "ad | similique | voluptatem\ncorrupti | est | rerum\nmolestiae | quidem | et"

# Random - randomly chooses an above method
Faker::Markdown.random #=> returns output from a single method outlined above
```
