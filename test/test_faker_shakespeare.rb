require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerShakespeare < Test::Unit::TestCase      
  def setup
    @romeo_and_juliet = Faker::Shakespeare.romeo_and_juliet
	  @king_richard_iii = Faker::Shakespeare.king_richard_iii
	  @as_you_like_it = Faker::Shakespeare.as_you_like_it
	  @hamlet = Faker::Shakespeare.hamlet
  end
  
  def test_quotes
    assert @romeo_and_juliet.size == 11    
    @romeo_and_juliet.each do |quotes|
       assert !quotes.nil?
       assert quotes != ""
    end    

	assert @king_richard_iii.size == 8    
    @king_richard_iii.each do |quotes|
       assert !quotes.nil?
       assert quotes != ""
    end   

	assert @as_you_like_it.size == 8   
    @as_you_like_it.each do |quotes|
       assert !quotes.nil?
       assert quotes != ""
    end   

	assert @hamlet.size == 18    
    @hamlet.each do |quotes|
       assert !quotes.nil?
       assert quotes != ""
    end       
  end  
  
  def test_as_you_like_it_quote
    assert Faker::Shakespeare.as_you_like_it_quote.match(/\w+/)
  end
  
  def test_king_richard_iii_quote
    assert Faker::Shakespeare.king_richard_iii_quote.match(/\w+/)
  end
  
  def test_romeo_and_juliet_quote
    assert Faker::Shakespeare.romeo_and_juliet_quote.match(/\w+/)
  end
  
  def test_hamlet_quote
    assert Faker::Shakespeare.hamlet_quote.match(/\w+/)
  end
  
end
