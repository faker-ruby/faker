# frozen_string_literal: true

module Faker
  class HTML < Base
    class << self
      ##
      # Produces a random HTML header format.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.headers #=> "<h5>Autem</h5>"
      #
      # @faker.version next
      def headers
        "<h#{rand(1..6)}>#{Lorem.word.capitalize}</h#{rand(1..6)}>"
      end

      ##
      # Produces a random HTML paragraph format.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.paragraphs #=> "<p>Incidunt atque quis</p>"
      #
      # @faker.version next
      def paragraphs
        "<p>#{Faker::Lorem.paragraph(sentence_count: 3)}</p>"
      end

      ##
      # Produces a random emphasis formatting on a random word in two HTML paragraphs.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.emphasis #=> "<p>Incidunt atque quis <em>repellat</em> id impedit. Quas numquam quod incidunt dicta non. Blanditiis delectus laudantium atque reiciendis qui.</p>"
      #
      # @faker.version next
      def emphasis
        contents = []
        2.times do
          paragraph = paragraphs
          words = paragraph.split
          position = rand(0..words.length - 1)
          words[position] = "<em>#{words[position]}</em>"
          contents << words.join(' ')
        end
        contents.join("\n")
      end

      ##
      # Produces a random ordered list of items between 1 and 10 randomly in HTML format.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.ordered_list #=> "<ol>\n<li>Qui reiciendis non consequatur atque.</li>\n<li>Quo doloremque veritatis tempora aut.</li>\n<li>Aspernatur.</li>\n<li>Ea ab.</li>\n<li>Qui.</li>\n<li>Sit pariatur nemo eveniet.</li>\n<li>Molestiae aut.</li>\n<li>Nihil molestias iure placeat.</li>\n<li>Dolore autem quisquam.</li>\n</ol>"
      #
      # @faker.version next
      def ordered_list
        number = rand(1..10)

        items = []
        number.times do
          items << "<li>#{Faker::Lorem.sentence(word_count: 1)}</li>"
        end

        "<ol>\n#{items.join("\n")}\n</ol>"
      end

      ##
      # Produces a random unordered list of items between 1 and 10 randomly in HTML format.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.unordered_list #=> "<ul>\n<li>Voluptatum aliquid tempora molestiae facilis non sed.</li>\n<li>Nostrum omnis iste impedit voluptatum dolor.</li>\n<li>Esse quidem et facere.</li>\n</ul>"
      #
      # @faker.version next
      def unordered_list
        number = rand(1..10)

        items = []
        number.times do
          items << "<li>#{Faker::Lorem.sentence(word_count: 1)}</li>"
        end

        "<ul>\n#{items.join("\n")}\n</ul>"
      end

      ##
      # Produces a random code block formatted in HTML.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.block_code #=> "<pre><code>Eos quasi qui.</code></pre>"
      #
      # @faker.version next
      def block_code
        "<pre>\n<code>#{Lorem.sentence(word_count: 1)}</code>\n</pre>"
      end

      ##
      # Produces a random HTML table with 3 rows and 3 columns.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.table #=> "<table>\n<tr>\n<th>ad</th>\n<th>similique</th>\n<th>voluptatem</th>\n</tr>\n<tr>\n<td>corrupti</td>\n<td>est</td>\n<td>rerum</td>\n</tr>\n<tr>\n<td>molestiae</td>\n<td>quidem</td>\n<td>et</td>\n</tr>\n</table>"
      #
      # @faker.version next
      def table
        rows = []
        3.times do
          row = "<tr>\n"
          3.times do
            row += "<td>#{Lorem.word}</td>\n"
          end
          row += '</tr>'
          rows << row
        end

        "<table>\n#{rows.join("\n")}\n</table>"
      end

      ##
      # Generates a random <script> tag with the `src` attribute set to a random URL.
      #
      # @return [String]
      #
      def script
        "<script src=\"#{Faker::Internet.url}\"></script>"
      end

      ##
      # Generates a random <link> tag with the `rel` attribute set to "stylesheet" and the `href` attribute set to a random URL.
      #
      # @param rel [String] The rel of the link tag.
      # @return [String]
      #
      def link(rel: 'stylesheet')
        "<link rel=\"#{rel}\" href=\"#{Faker::Internet.url}\">"
      end

      ##
      # Generates HTML content with customizable attributes for any HTML tag.
      #
      # @param tag [String] The HTML tag to generate.
      # @param content [String] The Content of the HTML tag.
      # @param attributes [Hash] The attributes to include in the tag.
      # @return [String]
      #
      # @example
      #   Faker::HTML.custom(tag: 'div', content: "This is a div with XSS attributes.", attributes: {class: 'xss', onclick: "alert('XSS')"}) #=> "<div class=\"xss\" onclick=\"alert('XSS')\">This is a div with XSS attributes.</div>"
      #
      # @faker.version next
      def custom(tag: 'div', content: Lorem.sentence(word_count: 3), attributes: { class: Lorem.word, onclick: "#{Lorem.word}()" })
        attribute_string = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
        "<#{tag} #{attribute_string}>#{content}</#{tag}>"
      end

      ##
      # Produces a random method from the methods above, excluding the methods listed in the arguments.
      #
      # @overload random(methods)
      #   @param methods [Symbol] Specify which methods to exclude.
      #
      # @return [String]
      #
      # @example
      #   Faker::HTML.random #=> returns output from a single method outlined above
      #   Faker::HTML.random(:table) #=> returns output from any single method outlined above except for "table"
      #   Faker::HTML.random(:ordered_list, :unordered_list) #=> returns output from any single method outlined above except for either ordered_list and unordered_list
      #
      # @faker.version next
      def random(*args)
        method_list = available_methods
        args&.each { |ex| method_list.delete_if { |meth| meth == ex.to_sym } }
        send(method_list[Faker::Config.random.rand(0..method_list.length - 1)])
      end

      private

      def available_methods
        (HTML.public_methods(false) - Base.methods).sort
      end
    end
  end
end
