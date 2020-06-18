# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEducator < Test::Unit::TestCase
  def setup
    @tester = Faker::Educator
  end

  def test_university
    assert @tester.university.match?(/(\w+\.? ?){2,3}/)
  end

  def test_degree
    assert @tester.degree.match?(/(\w+\.? ?\(?\)?){3,6}/)
  end

  def test_subject
    assert @tester.subject.match?(/(\w+\.? ?\(?\)?){1,3}/)
  end

  def test_course_name
    assert @tester.course_name.match?(/(\w+\.? ?\(?\)?){1,3} \d{3}/)
  end

  def test_secondary_school
    assert @tester.secondary_school.match?(/(\w+\.? ?){2,3}/)
  end

  def test_campus
    assert @tester.campus.match?(/(\w+\.? ?){1,2}/)
  end
end
