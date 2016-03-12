require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerWine < Test::Unit::TestCase

  def setup
    @tester = Faker::Wine
  end

  def test_varietal
    assert @tester.varietal.match(/\w+/)
  end

  def test_vintage
    assert @tester.vintage.match(/[0-9]{4}/)
    assert @tester.vintage.to_i >= 1960
    assert @tester.vintage.to_i <= 2016
  end

  def test_new_vintage
    assert @tester.new_vintage.match(/[0-9]{4}/)
    assert @tester.new_vintage.to_i >= 2006
    assert @tester.new_vintage.to_i <= 2016
  end

  def test_old_vintage
    assert @tester.old_vintage.match(/[0-9]{4}/)
    assert @tester.old_vintage.to_i >= 1960
    assert @tester.old_vintage.to_i <= 2006
  end

  def test_appellation
    assert @tester.appellation.match(/\w+/)
  end

  def test_producer
    assert @tester.producer.match(/\w+/)
  end

  def test_note
    assert @tester.note.match(/\w+/)
  end

  def test_process
    assert @tester.process.match(/\w+/)
  end

  def test_process_description
    assert @tester.process_description.match(/\w+/)
  end

  def test_process_templates
    assert @tester.process_templates.size == 7
    @tester.process_templates.each do |template|
       assert !template.nil?
       assert template != ""
    end
  end

  def test_publication
    assert @tester.publication.match(/\w+/)
  end

  def test_points
    assert @tester.points.match(/[0-9]{2,3}/)
    assert @tester.points.to_i >= 80
    assert @tester.points.to_i <= 100
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_nickname
    assert @tester.nickname.match(/\w+/)
  end

  def test_name_templates
    assert @tester.name_templates.size == 5
    @tester.name_templates.each do |template|
       assert !template.nil?
       assert template != ""
    end
  end

  def test_adjective
    assert @tester.adjective.match(/\w+/)
  end

  def test_description
    assert @tester.description.match(/\w+/)
  end

  def test_description_templates
    assert @tester.description_templates.size == 10
    @tester.description_templates.each do |template|
       assert !template.nil?
       assert template != ""
    end

  end

  def test_rating
    assert @tester.rating.match(/\w+/)
  end

  def test_snob
    assert @tester.snob.match(/\w+/)
  end

  def test_snob_templates
    assert @tester.snob_templates.size == 15
    @tester.snob_templates.each do |template|
       assert !template.nil?
       assert template != ""
    end
  end

  def test_food
    assert @tester.food.match(/\w+/)
  end

  def test_pairing
    assert @tester.pairing.match(/\w+/)
  end

end
