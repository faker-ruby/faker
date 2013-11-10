require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

def assert_list_translation(name, min_count, regex)
	list = Faker::Base.translate(name)
	assert list.length >= min_count
	assert_each_element_matches_regex(list, regex)
end

def all_ukrainian_characters
	/^[-’ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮйцукенгшщзхїфівапролджєячсмитьбю ]+$/i
end

def small_ukrainian_characters
	/^[йцукенгшщзхїфівапролджєячсмитьбю.]+$/i
end

class TestUkLocale < Test::Unit::TestCase

	class << self
		def startup
			Faker::Config.locale = :uk		
		end
		def shutdown
			Faker::Config.locale = nil
		end
	end

	def test_uk_locale_exist
		assert File.exist?(File.dirname(__FILE__) + '/../lib/locales/uk.yml')
	end

	def test_uk_locale_defines_countries
		assert_list_translation('faker.address.country', 100, all_ukrainian_characters)
	end

	def test_uk_locale_defines_building_number
		assert_list_translation('faker.address.building_number', 1, /^\#{1,3}$/)
	end

	def test_uk_locale_defines_street_suffix
		assert_list_translation('faker.address.street_suffix', 5, small_ukrainian_characters)
	end

	def test_uk_locale_defines_states
		assert_list_translation('faker.address.state', 20, all_ukrainian_characters)
	end

	def test_uk_locale_defines_street_titles
		assert_list_translation('faker.address.street_title', 100, all_ukrainian_characters)
	end

	def test_uk_locale_defines_cities
		assert_list_translation('faker.address.city_name', 100, all_ukrainian_characters)
	end

	def test_uk_locale_defines_male_first_name
		assert_list_translation('faker.name.male_first_name', 100, all_ukrainian_characters)
	end

	def test_uk_locale_defines_male_middle_name
		assert_list_translation('faker.name.male_middle_name', 20, all_ukrainian_characters)
	end

	def test_uk_locale_defines_male_last_name
		assert_list_translation('faker.name.male_last_name', 100, all_ukrainian_characters)
	end

	def test_uk_locale_defines_female_first_name
		assert_list_translation('faker.name.female_first_name', 50, all_ukrainian_characters)
	end

	def test_uk_locale_defines_female_middle_name
		assert_list_translation('faker.name.female_middle_name', 20, all_ukrainian_characters)
	end

	def test_uk_locale_defines_female_last_name
		assert_equal Faker::Base.translate('faker.name.female_last_name'), '#{male_last_name}'
	end

	def test_uk_locale_defines_phone_format
		assert_equal Faker::Base.translate('faker.phone_number.formats').first, '(0##)###-##-##'
	end

end