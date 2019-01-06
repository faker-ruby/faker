# Faker::Markdown

Available since version 1.8.0.

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

# Table - generates a 3x4 table with a row of headings, a row of hyphens and two rows of data
Faker::Markdown.table #=> "ad | similique | voluptatem\n---- | ---- | ----\ncorrupti | est | rerum\nmolestiae | quidem | et"

# Random - randomly chooses an above method
Faker::Markdown.random #=> returns output from a single method outlined above

# Random("excluded_method") - will exclude the passed in method name
Faker::Markdown.random("table") #=> returns output from any single method outlined above except for "table"
Faker::Markdown.random("ordered_list", "unordered_list") #=> returns output from any single method outlined above except for either ordered_list and unordered_list

# Sandwich - creates a simulated blog-esque text-heavy block in markdown
Faker::Markdown.sandwich #=> returns newline separated content of 1 header, 1 default lorem paragraph, and 1 random markdown element

Faker::Markdown.sandwich(5) #=> returns newline separated content of 1 header, 1 5-sentence lorem paragraph, and 1 random markdown element

Faker::Markdown.sandwich(6, 3) #=> returns newline separated content of 1 header, and then 3 sections consisting of, here, 1 6-sentence lorem paragraph and 1 random markdown element. The random markdown element is chosen at random in each iteration of the paragraph-markdown pairing.
```
