require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

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
		assert Faker::Base.translate('faker.address.country').length > 100
		Faker::Base.translate('faker.address.country').each do | c |
			assert_match(/^[-’ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮйцукенгшщзхїфівапролджєячсмитьбю ]+$/i, c)
		end
	end

	def test_uk_locale_defines_building_number
		Faker::Base.translate('faker.address.building_number').each do | bn |
			assert_match(/^\#{1,3}$/, bn)
		end				
	end

	def test_uk_locale_defines_street_suffix
		assert Faker::Base.translate('faker.address.street_suffix').length > 5
		Faker::Base.translate('faker.address.street_suffix').each do | sp |
			assert_match(/^[йцукенгшщзхїфівапролджєячсмитьбю.]+$/i, sp)
		end						
	end

	def test_uk_locale_defines_states
		assert Faker::Base.translate('faker.address.state').length > 20
		Faker::Base.translate('faker.address.state').each do | s |
			assert_match(/^[-ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮйцукенгшщзхїфівапролджєячсмитьбю ]+$/i, s)
		end
	end

	def test_uk_locale_defines_street_titles
		assert Faker::Base.translate('faker.address.street_title').length > 100
		Faker::Base.translate('faker.address.street_title').each do | st |
			assert_match(/^[-ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮйцукенгшщзхїфівапролджєячсмитьбю ]+$/i, st)
		end
	end

		def test_uk_locale_defines_cities
		assert Faker::Base.translate('faker.address.city_name').length > 100
		Faker::Base.translate('faker.address.city_name').each do | c |
			assert_match(/^[-’ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮйцукенгшщзхїфівапролджєячсмитьбю ]+$/i, c)
		end
	end

end