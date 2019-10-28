# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternetHTTP < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet::HTTP
  end

  def test_status_code
    assert @tester.status_code.to_s.match(/^[1-5]\d{2}$/)
  end

  def test_information_status_code
    assert @tester.information_status_code.to_s.match(/^1\d{2}$/)
  end

  def test_successful_status_code
    assert @tester.successful_status_code.to_s.match(/^2\d{2}$/)
  end

  def test_redirect_status_code
    assert @tester.redirect_status_code.to_s.match(/^3\d{2}$/)
  end

  def test_client_error_status_code
    assert @tester.client_error_status_code.to_s.match(/^4\d{2}$/)
  end

  def test_server_error_status_code
    assert @tester.server_error_status_code.to_s.match(/^5\d{2}$/)
  end
end
