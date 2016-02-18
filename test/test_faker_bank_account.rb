require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBankAccount < Test::Unit::TestCase
	def test_routing_number
		assert Faker::BankAccount.routing_number.match(/\d{9}/)
	end

	def test_fraction_notation
		fraction = Faker::BankAccount.routing_number(true)
		assert fraction.match(/\d{1,2}[-]\d{1,4}[\/]\d{1,4}/)
	end

	def test_account_number
		assert Faker::BankAccount.account_number(/\d{10}/)
	end

	def test_iban
		assert Faker::BankAccount.iban(/[a-zA-Z][a-zA-Z]\d{2}\s?([0-9a-zA-Z]{4}\s?){4}[0-9a-zA-Z]{2}/)
	end

	def test_swift
		assert Faker::BankAccount.swift(/[a-zA-Z]{6}\d{2}/)
	end

	def test_institution_name
		assert_kind_of String, Faker::BankAccount.institution_name
	end
end