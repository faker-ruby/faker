# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEducator < Test::Unit::TestCase
  def setup
    @tester = Faker::Educator
  end

  def test_university
    assert_match @tester.university, /(\w+\.? ?){2,3}/
  end

  def test_degree
    assert_match @tester.degree, /(\w+\.? ?\(?\)?){3,6}/
  end

  def test_subject
    assert_match @tester.subject, /(\w+\.? ?\(?\)?){1,3}/
  end

  def test_course_name
    assert_match @tester.course_name, /(\w+\.? ?\(?\)?){1,3} \d{3}/
  end

  def test_secondary_school
    assert_match @tester.secondary_school, /(\w+\.? ?){2,3}/
  end

  def test_primary_school
    assert_match @tester.primary_school, /(\w+\.? ?){2,3}/
  end

  def test_campus
    assert_match @tester.campus, /(\w+\.? ?){1,2}/
  end
end
