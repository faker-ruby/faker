require_relative '../../test_helper'

class TestFakerGod < Test::Unit::TestCase

    def setup
      @tester = Faker::God
    end

    def test_name
        assert @tester.name.match(/\w+/)
    end

    def test_type
        assert @tester.type.match(/\w+/)
    end
    
end
