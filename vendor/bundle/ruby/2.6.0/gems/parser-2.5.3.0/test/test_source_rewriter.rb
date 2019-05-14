# frozen_string_literal: true

require 'helper'

class TestSourceRewriter < Minitest::Test
  def setup
    @buf = Parser::Source::Buffer.new('(rewriter)')
    @buf.source = 'foo bar baz'
    Parser::Source::Rewriter.warned_of_deprecation = true
    @rewriter = Parser::Source::Rewriter.new(@buf)
  end

  def range(from, len)
    Parser::Source::Range.new(@buf, from, from + len)
  end

  def test_remove
    assert_equal 'foo  baz',
                 @rewriter.
                    remove(range(4, 3)).
                    process
  end

  def test_insert_before
    assert_equal 'foo quux bar baz',
                 @rewriter.
                    insert_before(range(4, 3), 'quux ').
                    process
  end

  def test_insert_after
    assert_equal 'foo bar quux baz',
                 @rewriter.
                    insert_after(range(4, 3), ' quux').
                    process
  end

  def test_replace
    assert_equal 'foo quux baz',
                 @rewriter.
                    replace(range(4, 3), 'quux').
                    process
  end

  def test_composing_asc
    assert_equal 'foo---bar---baz',
                 @rewriter.
                    replace(range(3, 1), '---').
                    replace(range(7, 1), '---').
                    process
  end

  def test_composing_desc
    assert_equal 'foo---bar---baz',
                 @rewriter.
                    replace(range(7, 1), '---').
                    replace(range(3, 1), '---').
                    process
  end

  #
  # Merging/clobbering of overlapping edits
  #

  def test_insertion_just_before_replace
    assert_equal 'foostrawberry jam---bar baz',
      @rewriter.
        replace(range(3, 1), '---').
        insert_before(range(3, 1), 'strawberry jam').
        process
  end

  def test_insertion_just_after_replace
    assert_equal 'foo---strawberry jam baz',
      @rewriter.
        replace(range(3, 4), '---').
        insert_after(range(3, 4), 'strawberry jam').
        process
  end

  def test_insertion_just_before_remove
    assert_equal 'foostrawberry jambar baz',
      @rewriter.
        remove(range(3, 1)).
        insert_before(range(3, 1), 'strawberry jam').
        process
  end

  def test_insertion_just_after_remove
    assert_equal 'foostrawberry jam baz',
      @rewriter.
        remove(range(3, 4)).
        insert_after(range(3, 4), 'strawberry jam').
        process
  end

  def test_insertion_just_before_replace_at_buffer_start
    assert_equal 'strawberry jam--- bar baz',
      @rewriter.
        replace(range(0, 3), '---').
        insert_before(range(0, 1), 'strawberry jam').
        process
  end

  def test_insertion_just_after_replace_at_buffer_end
    assert_equal 'foo bar ---strawberry jam',
      @rewriter.
        replace(range(8, 3), '---').
        insert_after(range(9, 2), 'strawberry jam').
        process
  end

  def test_insertion_just_before_remove_at_buffer_start
    assert_equal 'strawberry bar baz',
      @rewriter.
        remove(range(0, 3)).
        insert_before(range(0, 1), 'strawberry').
        process
  end

  def test_insertion_just_after_remove_at_buffer_end
    assert_equal 'foo bar strawberry',
      @rewriter.
        remove(range(8, 3)).
        insert_after(range(10, 1), 'strawberry').
        process
  end

  def test_multiple_insertions_at_same_location_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_before(range(0, 11), '<').
        insert_after( range(0, 11), '>').
        insert_before(range(0, 7), '(')
    end
  end

  def test_intentional_multiple_insertions_at_same_location
    assert_equal 'foo [(bar)] baz',
      @rewriter.
        insert_before_multi(range(4, 0), '(').
        insert_after_multi(range(7, 0), ')').
        insert_before_multi(range(4, 0), '[').
        insert_after_multi(range(7, 0), ']').
        process
  end

  def test_insertion_within_replace_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(3, 2), '<').
        insert_after(range(3, 1), '>')
    end
  end

  def test_insertion_within_remove_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        remove(range(3, 2)).
        insert_after(range(3, 1), '>')
    end
  end

  def test_replace_overlapping_insertion_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_after(range(3, 1), '>').
        replace(range(3, 2), '<')
    end
  end

  def test_remove_overlapping_insertion_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_after(range(3, 1), '>').
        remove(range(3, 2))
    end
  end

  def test_multi_insertion_within_replace_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(3, 2), '<').
        insert_after_multi(range(3, 1), '>')
    end
  end

  def test_multi_insertion_within_remove_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        remove(range(3, 2)).
        insert_after_multi(range(3, 1), '>')
    end
  end

  def test_replace_overlapping_multi_insertion_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_after_multi(range(3, 1), '>').
        replace(range(3, 2), '<')
    end
  end

  def test_remove_overlapping_multi_insertion_clobber
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_after_multi(range(3, 1), '>').
        remove(range(3, 2))
    end
  end

  def test_insertion_on_merged_insertion_clobber
    # 2 insertions at the same point clobber each other, even if the 1st one
    # was merged with an adjacent edit, and even if the same text is being
    # inserted

    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        insert_before(range(3, 1), '>').
        remove(range(3, 2)).
        insert_after(range(2, 1), '>')
    end
  end

  def test_insertion_merge_with_overlapping_replace
    assert_equal 'fo abc bar baz',
      @rewriter.
        insert_before(range(3, 1), 'abc').
        replace(range(2, 2), ' abc ').
        process
  end

  def test_replace_merge_with_overlapped_insertion
    assert_equal 'fo abc bar baz',
      @rewriter.
        replace(range(2, 2), ' abc ').
        insert_before(range(3, 1), 'abc').
        process
  end

  def test_replace_same_begin_larger_than_replaced_range_matching
    assert_equal 'foo supercalifragilistic baz',
      @rewriter.
        replace(range(4, 3), 'super').
        replace(range(4, 3), 'supercalifragilistic').
        process
  end

  def test_replace_same_begin_larger_than_replaced_range_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(4, 3), 'super!').
        replace(range(4, 3), 'supercalifragilistic')
    end
  end

  def test_overlapping_replace_left_smaller_than_replaced_matching
    assert_equal 'superbaz',
      @rewriter.
        replace(range(0, 7), 'super').
        replace(range(2, 6), 'per').
        process
  end

  def test_overlapping_replace_left_smaller_than_replaced_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(0, 7), 'super').
        replace(range(2, 8), 'perk')
    end
  end

  def test_overlapping_replace_left_larger_right_smaller_matching
    assert_equal 'foods baz',
      @rewriter.
        replace(range(1, 3), 'oods ').
        replace(range(3, 6), 'ds b').
        process
  end

  def test_overlapping_replace_left_larger_right_larger_matching
    assert_equal 'foods abcdefghijklm',
      @rewriter.
        replace(range(1, 3), 'oods ').
        replace(range(3, 8), 'ds abcdefghijklm').
        process
  end

  def test_overlapping_replace_left_larger_right_smaller_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(1, 3), 'oods ').
        replace(range(3, 6), 'ds')
    end
  end

  def test_overlapping_replace_left_larger_right_larger_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(1, 3), 'oods b').
        replace(range(3, 8), 'ds abcdefghijklm')
    end
  end

  def test_subsuming_replace_both_smaller_matching
    assert_equal 'food baz',
      @rewriter.
        replace(range(0, 7), 'food').
        replace(range(3, 3), 'd').
        process
  end

  def test_subsuming_replace_both_smaller_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(0, 7), 'foo').
        replace(range(3, 3), 'd')
    end
  end

  def test_subsuming_replace_both_larger_matching
    assert_equal 'foo barr baz',
      @rewriter.
        replace(range(0, 7), 'foo barr').
        replace(range(3, 3), ' bar').
        process
  end

  def test_subsuming_replace_both_larger_non_matching
    silence_diagnostics

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(0, 7), 'foo barr').
        replace(range(3, 3), ' bar ')
    end
  end

  def test_replaced_ranges_merge_when_furthest_right_range_is_not_furthest_left
    # regression test; previously, when actions were merged, the resulting
    # replaced range could be too small sometimes
    assert_equal 'foo_***_***',
      @rewriter.
        replace(range(3, 1), '_').
        replace(range(7, 1), '_').
        replace(range(4, 7), '***_***').
        process
  end

  def test_clobber
    diagnostics = []
    @rewriter.diagnostics.consumer = lambda do |diag|
      diagnostics << diag
    end

    assert_raises Parser::ClobberingError do
      @rewriter.
        replace(range(3, 1), '---').
        remove(range(3, 1))
    end

    assert_equal 2, diagnostics.count

    assert_equal :error, diagnostics.first.level
    assert_equal 'cannot remove 1 character(s)',
                 diagnostics.first.message
    assert_equal range(3, 1), diagnostics.first.location

    assert_equal :note, diagnostics.last.level
    assert_equal "clobbered by: replace 1 character(s) with \"---\"",
                 diagnostics.last.message
    assert_equal range(3, 1), diagnostics.last.location
  end

  def test_clobbering_error_backward_compatibility
    silence_diagnostics

    rescued = false

    # We use begin..rescue..end here rather than #assert_raises
    # since #assert_raises expects exact error class.
    begin
      @rewriter.
        replace(range(3, 1), '---').
        remove(range(3, 1))
    rescue RuntimeError => error
      rescued = true if error.message.include?('clobber')
    end

    assert rescued
  end


  def test_crossing_delete
    assert_equal 'faz',
                 @rewriter.
                   remove(range(1, 4)).
                   remove(range(6, 3)).
                   remove(range(4, 3)).
                   process
  end

  def test_overlapping_replace
    assert_equal 'flippin flyin flapjackz',
                 @rewriter.
                   replace(range(1, 4), 'lippin f').
                   replace(range(4, 4), 'pin flyin flap').
                   replace(range(7, 3), ' flyin flapjack').
                   process
  end

  def test_subsuming_delete
    assert_equal 'foo',
                 @rewriter.
                   remove(range(6, 3)).
                   remove(range(7, 2)).
                   remove(range(3, 8)).
                   process
  end

  def test_subsuming_replace
    assert_equal 'freebie',
                 @rewriter.
                   replace(range(3, 3), 'ebi').
                   replace(range(1, 10), 'reebie').
                   replace(range(5, 2), 'ie').
                   process
  end

  def test_equivalent_delete_insert_replace
    # A deletion + insertion just before or after the deleted range is
    # identical in every way to a replacement! So logically, they shouldn't
    # conflict.
    assert_equal 'tin bar baz',
      @rewriter.
        remove(range(0, 3)).  # ' bar baz'
        insert_before(range(0, 1), 'tin'). # 'tin bar baz'
        replace(range(0, 3), 'tin').
        process
  end

  def test_transaction_returns_self
    assert_equal @rewriter, @rewriter.transaction {}
  end

  def test_transaction_commit
    silence_diagnostics

    # Original: 'foo bar baz'

    # Rewrite as 'foo BAR baz'
    @rewriter.replace(range(4, 3), 'BAR')

    # Rewrite as '( bar )'
    @rewriter.transaction do
      @rewriter.replace(range(0, 3), '(')
      @rewriter.replace(range(8, 3), ')')
    end

    @rewriter.replace(range(3, 1), '_')
    @rewriter.replace(range(7, 1), '_')

    assert_equal '(_BAR_)', @rewriter.process
  end

  def test_transaction_rollback
    silence_diagnostics

    # Original: 'foo bar baz'

    # Rewrite as 'foo bar BAZ'
    @rewriter.replace(range(8, 3), 'BAZ')

    assert_raises Parser::ClobberingError do
      # Trying to rewrite as '( bar )', but it fails
      @rewriter.transaction do
        @rewriter.replace(range(0, 3), '(')
        @rewriter.replace(range(8, 3), ')')
      end
    end

    @rewriter.replace(range(0, 3), 'FOO')

    assert_equal 'FOO bar BAZ', @rewriter.process
  end

  def test_nested_transaction_raises_error
    error = assert_raises RuntimeError do
      @rewriter.transaction do
        @rewriter.transaction do
        end
      end
    end

    assert_match /nested/i, error.message
  end

  def test_process_in_transaction_raises_error
    error = assert_raises RuntimeError do
      @rewriter.transaction do
        @rewriter.process
      end
    end

    assert_match /transaction/, error.message
  end

  def silence_diagnostics
    @rewriter.diagnostics.consumer = proc {}
  end
end
