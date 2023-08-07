# Faker::HTML

Available since version 3.2.1.

The `Faker::HTML` module provides methods for generating random HTML content.

```ruby
# heading - Produces a random HTML heading format.
Faker::HTML.heading #=> "<h5>Autem</h5>"

# paragraph - Produces a string representing an HTML paragraph.
Faker::HTML.paragraph #=> "<p>Incidunt atque quis</p>"

# emphasis - Produces a random emphasis formatting on a random sentence.
Faker::HTML.emphasis #=> "<em>repellat id impedit.</em>

# ordered_list - Produces a random ordered list of items between 1 and 10 in HTML format.
Faker::HTML.ordered_list #=> "<ol>\n<li>Qui reiciendis non consequatur atque.</li>\n<li>Quo doloremque veritatis tempora aut.</li>\n<li>Aspernatur.</li>\n<li>Ea ab.</li>\n<li>Qui.</li>\n<li>Sit pariatur nemo eveniet.</li>\n<li>Molestiae aut.</li>\n<li>Nihil molestias iure placeat.</li>\n<li>Dolore autem quisquam.</li>\n</ol>"

# unordered_list - Produces a random unordered list of items between 1 and 10 in HTML format.
Faker::HTML.unordered_list #=> "<ul>\n<li>Voluptatum aliquid tempora molestiae facilis non sed.</li>\n<li>Nostrum omnis iste impedit voluptatum dolor.</li>\n<li>Esse quidem et facere.</li>\n</ul>"

# code - Produces a random code block formatted in HTML.
Faker::HTML.code #=> "<pre>\n<code>Eos quasi qui.</code>\n</pre>"

# table - Produces a random HTML table with 3 rows and 3 columns.
Faker::HTML.table #=> "<table>\n<thead>\n<th>ad</th>\n<th>similique</th>\n<th>voluptatem</th>\n</thead>\n<tbody>\n<td>corrupti</td>\n<td>est</td>\n<td>rerum</td>\n<td>molestiae</td>\n<td>quidem</td>\n<td>et</td>\n<td>in</td>\n<td>tempora</td>\n<td>at</td>\n<\tbody>\n<tfoot>\n<td>voluptatem</td>\n<td>debitis</td>\n<td>rem</td>\n</tfoot>\n</table>"

# script - Generates a random <script> tag with the src attribute set to a random URL.
Faker::HTML.script #=> "<script src=\"http://gulgowski.name/jordan.weimann.js\"></script>"

# link - Generates a random <link> tag with the rel attribute set to "stylesheet" and the href attribute set to a random URL.
Faker::HTML.link #=> "<link rel=\"stylesheet\" href=\"http://fay.io/darryl.barrows.css\">"
Faker::HTML.link(rel: 'icon') #=> "<link rel=\"icon\" href=\"http://fay.io/darryl.barrows.css\">"

# element - Generates HTML content with customizable attributes for any HTML tag.
Faker::HTML.element(tag: 'div', content: "This is a div with XSS attributes.", attributes: {class: 'xss', onclick: "alert('XSS')"}) #=> "<div class=\"xss\" onclick=\"alert('XSS')\">This is a div with XSS attributes.</div>"

# random - Produces a random output from one of the methods outlined above, excluding the methods listed in the arguments.
Faker::HTML.random #=> returns output from a single method outlined above
Faker::HTML.random(exclude: [:table]) #=> returns output from any single method outlined above except for "table"
Faker::HTML.random(exclude: [:ordered_list, :unordered_list]) #=> returns output from any single method outlined above except for ordered_list and unordered_list

# sandwich - Generates a random sandwich-style HTML content with customizable attributes.
Faker::HTML.sandwich #=> returns sandwich-style HTML content as a string
Faker::HTML.sandwich(sentences: 5, repeat: 3) #=> returns sandwich-style HTML content with 5 sentences per paragraph and repeated 3 times
```
