# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHTML < Test::Unit::TestCase
  def setup
    @tester = Faker::HTML
  end

  def test_heading
    header = @tester.heading
    level = header.match(/<h(\d)>/i)[1].to_i
    open_tag = "<h#{level}>"
    close_tag = "</h#{level}>"

    assert(header.start_with?(open_tag))
    assert(header.end_with?(close_tag))
  end

  def test_paragraph
    assert_match(/<p>.+<\/p>/, @tester.paragraph)
  end

  def test_emphasis
    assert_match(/<em>.*<\/em>/, @tester.emphasis)
  end

  def test_ordered_list
    assert_match(/<ol>.*<\/ol>/m, @tester.ordered_list)
  end

  def test_unordered_list
    assert_match(/<ul>.*<\/ul>/m, @tester.unordered_list)
  end

  def test_code
    assert_match(/<code>.+<\/code>/, @tester.code)
  end

  def test_table
    table_html = @tester.table

    assert(table_html.start_with?('<table>'))
    assert(table_html.end_with?('</table>'))

    assert_equal(1, count_occurrences(table_html, '<thead>'))
    assert_equal(1, count_occurrences(table_html, '<tbody>'))
    assert_equal(1, count_occurrences(table_html, '<tfoot>'))
    assert_equal(3, count_occurrences(table_html, '<th>'))
    assert_equal(5, count_occurrences(table_html, '<tr>'))
    assert_equal(12, count_occurrences(table_html, '<td>'))
  end

  def test_script
    assert_match(/<script src=".+"><\/script>/, @tester.script)
  end

  def test_link
    assert_match(/<link rel=".+" href=".+">/, @tester.link)
    assert_match(/<link rel="alternate" href=".+">/, @tester.link(rel: 'alternate'))
  end

  def test_element
    assert_match(/<div .+>.+<\/div>/, @tester.element)
    assert_match(/<span .+>.+<\/span>/, @tester.element(tag: 'span'))
  end

  def test_random
    assert_match(/<[^>]+>.*<\/[^>]+>|<link[^>]+>/, @tester.random)
  end

  def test_sandwich
    sandwich = @tester.sandwich(sentences: 2, repeat: 3)

    assert_match(/<h\d>[\w\s]+<\/h\d>/i, sandwich)
    assert_match(/<p>[\w\s.,!?]+<\/p>/i, sandwich)
    assert_match(/<[^>]+>[\w\s.,!?]*<\/[^>]+>/i, sandwich)
  end

  private

  def count_occurrences(text, substring)
    text.scan(substring).length
  end
end
