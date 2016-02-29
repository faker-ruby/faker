require File.dirname(__FILE__) + '/test_helper.rb'

module Faker
  class Foodie < Base
    flexible :chow
  end
end

class TestFlexible < Test::Unit::TestCase

  def setup
    I18n.backend.store_translations(:xx, :faker => {:chow => {:yummie => [:fudge, :chocolate, :caramel], :taste => "delicious"}})
    I18n.backend.store_translations(:home, :faker => {:address => {:birthplace => [:bed, :hospital, :airplane]}})
    I18n.backend.store_translations(:kindergarden, :faker => {:name => {:girls_name => [:alice, :cheryl, :tatiana]}})
    I18n.backend.store_translations(:work, :faker => {:company => {:do_stuff => [:work, :work, :work]}})
  end

  def test_flexible_multiple_values
    I18n.with_locale(:xx) do
      actual = Faker::Foodie.yummie
      assert [:fudge, :chocolate, :caramel].include? actual
    end
  end

  def test_flexible_single_value
    I18n.with_locale(:xx) do
      assert_equal "delicious", Faker::Foodie.taste
    end
  end

  def test_raises_no_method_error
    I18n.with_locale(:xx) do
      assert_raise(NoMethodError) do
        Faker::Foodie.eeew
      end
    end
  end
  
  def test_address_is_flexible
    I18n.with_locale(:home) do
      assert [:bed, :hospital, :airplane].include? Faker::Address.birthplace
    end
  end

  def test_name_is_flexible
    I18n.with_locale(:kindergarden) do
      assert [:alice, :cheryl, :tatiana].include? Faker::Name.girls_name
    end
  end

  def test_company_is_flexible
    I18n.with_locale(:work) do
      assert Faker::Company.do_stuff == :work
    end
  end
end
