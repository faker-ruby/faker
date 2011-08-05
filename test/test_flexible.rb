require File.dirname(__FILE__) + '/test_helper.rb'

module Faker
  class Foodie < Base
    flexible :chow
  end
end

class TestFlexible < Test::Unit::TestCase

  def setup
    I18n.backend.store_translations(:xx, :faker => {:chow => {:yummie => [:fudge, :chocolate, :caramel], :taste => "delicious"}})
  end

  def test_flexible_multiple_values
    I18n.with_locale(:xx) do
      assert [:fudge, :chocolate, :caramel].include? Faker::Foodie.yummie
    end
  end

  def test_flexible_single_value
    I18n.with_locale(:xx) do
      assert_equal "delicious", Faker::Foodie.taste
    end
  end

end
