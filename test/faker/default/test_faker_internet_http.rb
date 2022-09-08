# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternetHTTP < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet::HTTP
  end

  def test_status_code
    assert_match(/^[1-5]\d{2}$/, @tester.status_code.to_s)
  end

  def test_information_status_code
    assert_match(/^1\d{2}$/, @tester.status_code(group: :information).to_s)
  end

  def test_successful_status_code
    assert_match(/^2\d{2}$/, @tester.status_code(group: :successful).to_s)
  end

  def test_redirect_status_code
    assert_match(/^3\d{2}$/, @tester.status_code(group: :redirect).to_s)
  end

  def test_client_error_status_code
    assert_match(/^4\d{2}$/, @tester.status_code(group: :client_error).to_s)
  end

  def test_server_error_status_code
    assert_match(/^5\d{2}$/, @tester.status_code(group: :server_error).to_s)
  end

  def test_invalid_http_status_code_group
    exception = assert_raises ArgumentError do
      @tester.status_code(group: :inexistent)
    end
    assert_equal('Invalid HTTP status code group', exception.message)
  end
end
