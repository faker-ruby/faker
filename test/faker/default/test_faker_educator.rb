# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEducator < Test::Unit::TestCase
  def setup
    @tester = Faker::Educator
  end

  def test_university
    assert_match(/(\w+\.? ?){2,3}/, @tester.university)
  end

  def test_degree
    assert_match(/(\w+\.? ?\(?\)?){3,6}/, @tester.degree)
  end

  def test_subject
    assert_match(/(\w+\.? ?\(?\)?){1,3}/, @tester.subject)
  end

  def test_course_name
    assert_match(/(\w+\.? ?\(?\)?){1,3} \d{3}/, @tester.course_name)
  end

  def test_secondary_school
    assert_match(/(\w+\.? ?){2,3}/, @tester.secondary_school)
  end

  def test_primary_school
    assert_match(/(\w+\.? ?){2,3}/, @tester.primary_school)
  end

  def test_campus
    assert_match(/(\w+\.? ?){1,2}/, @tester.campus)
  end
end
