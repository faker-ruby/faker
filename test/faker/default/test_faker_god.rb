# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGod < Test::Unit::TestCase

    def setup
      @tester = Faker::God
    end

    def test_greek_god_name
        assert @tester.greek_god_name.match(/\w+/)
    end

    def test_roman_god_name
        assert @tester.roman_god_name.match(/\w+/)
    end

    def test_norse_god_name
        assert @tester.norse_god_name.match(/\w+/)
    end

    def test_hindu_god_name
        assert @tester.hindu_god_name.match(/\w+/)
    end

    def test_chinese_god_name
        assert @tester.chinese_god_name.match(/\w+/)
    end

    def test_mayan_god_name
        assert @tester.mayan_god_name.match(/\w+/)
    end

    def test_egyptian_god_name
        assert @tester.egyptian_god_name.match(/\w+/)
    end

    def test_aztec_god_name
        assert @tester.aztec_god_name.match(/\w+/)
    end

    def test_mythology
        assert @tester.mythology.match(/\w+/)
    end
    
end
