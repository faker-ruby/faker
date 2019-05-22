require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerOpera< Test::Unit::TestCase
  def setup
    @tester = Faker::Opera
  end

  def verdi
    assert @tester.verdi.match(/\w+/i)
  end

  def rossini
    assert @tester.rossini.match(/\w+/i)
  end

  def donizetti
    assert @tester.donizetti.match(/\w+/i)
  end

  def bellini
    assert @tester.bellini.match(/\w+/i)
  end
end
