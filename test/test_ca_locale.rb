require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestCaLocale < Test::Unit::TestCase
	def setup
		Faker::Config.locale = 'ca'
	end

	def teardown
		Faker::Config.locale = nil
	end

	def test_ca_methods
		assert Faker::Name.first_name.is_a? String
		assert Faker::Name.last_name.is_a? String
		assert Faker::Name.prefix.is_a? String
		assert Faker::Name.name.is_a? String
	end
end
