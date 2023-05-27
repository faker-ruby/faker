# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHTML < Test::Unit::TestCase
  def setup
    @tester = Faker::HTML
  end

  def test_headers
    assert_match(/<h[1-6]>.+<\/h[1-6]>/, @tester.headers)
  end

  def test_paragraphs
    assert_match(/<p>.+<\/p>/, @tester.paragraphs)
  end

  def test_emphasis
    assert_match(/<p>.*<em>.*<\/em>.*<\/p>/, @tester.emphasis)
  end

  def test_ordered_list
    assert_match(/<ol>.*<\/ol>/m, @tester.ordered_list)
  end

  def test_unordered_list
    assert_match(/<ul>.*<\/ul>/m, @tester.unordered_list)
  end

  def test_block_code
    assert_match(/<pre>\n<code>.+<\/code>\n<\/pre>/, @tester.block_code)
  end

  def test_table
    assert_match(/<table>.*<\/table>/m, @tester.table)
  end

  def test_script
    assert_match(/<script src=".+"><\/script>/, @tester.script)
  end

  def test_link
    assert_match(/<link rel=".+" href=".+">/, @tester.link)
    assert_match(/<link rel="alternate" href=".+">/, @tester.link(rel: 'alternate'))
  end

  def test_custom
    assert_match(/<div .+>.+<\/div>/, @tester.custom)
    assert_match(/<span .+>.+<\/span>/, @tester.custom(tag: 'span'))
  end

  def test_random
    assert_match(/<[^>]+>.*<\/[^>]+>/, @tester.random)
  end
end
