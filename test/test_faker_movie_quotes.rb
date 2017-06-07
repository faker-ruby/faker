
 require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

 class TestFakerMovieQuotes < Test::Unit::TestCase

   def setup
     @tester = Faker::MovieQuotes
   end

   def test_quote
     assert @tester.quote.match(/\w+/)
   end
 end
