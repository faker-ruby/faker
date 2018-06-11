require 'faker'

class FakeCustomer
	#miscellaneous member variables
	attr_accessor :say_something_smart
	attr_accessor :company_name

	#name related member variables
	attr_accessor :first_name
	attr_accessor :middle_name
	attr_accessor :last_name
	attr_accessor :full_name

	#credit related member variables
	attr_accessor :credit_card_number
	attr_accessor :credit_card_expiry_date
	attr_accessor :credit_card_type

	#address related member variables
	attr_accessor :city
	attr_accessor :city_suffix
	attr_accessor :city_prefix
	attr_accessor :building_number
	attr_accessor :state
	attr_accessor :postcode
	attr_accessor :street_suffix
	attr_accessor :street_name
	attr_accessor :full_street_address

	def initialize
	@say_something_smart = Faker::Hacker::say_something_smart
	@company_name = Faker::Company::name
	@first_name = Faker::Name.first_name
	@middle_name = Faker::Name.first_name #first name can also be used as a middle name
	@last_name =  Faker::Name.last_name
	@full_name = "#{@first_name} #{@middle_name} #{@last_name}"
	@credit_card_number = Faker::Business.credit_card_number
	@credit_card_expiry_date = Faker::Business.credit_card_expiry_date
	@credit_card_type = Faker::Business.credit_card_type
	@city = Faker::Address.city
	@city_suffix = Faker::Address.city_suffix
	@city_prefix = Faker::Address.city_prefix
	@street_address = Faker::Address.building_number
	@state = Faker::Address.state
	@postcode = Faker::Address.postcode
	@street_name = Faker::Address.street_name
	@street_suffix = Faker::Address.street_suffix
	@full_street_address = Faker::Address.street_address
	end
end
