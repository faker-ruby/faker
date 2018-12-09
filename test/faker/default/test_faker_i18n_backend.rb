# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerI18nBackend < Test::Unit::TestCase
  def test_faker_adds_own_backend_to_i18n_config
    # the initial require of faker in `test_helper` causes this to already be true
    assert I18n.backend.backends.any? { |backend| backend.instance_of? Faker::I18nBackend }
  end
end
