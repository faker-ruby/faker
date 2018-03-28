require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerDota < Test::Unit::TestCase
  def setup
    @tester = Faker::Dota
    @heroes = ['abaddon', 'alchemist', 'axe', 'beastmaster', 'brewmaster', 'bristleback', 'centaur',
               'chaos_knight', 'clockwerk', 'doom', 'dragon_knight', 'earth_spirit', 'earthshaker',
               'elder_titan', 'huskar', 'io', 'kunkka', 'legion_commander', 'lifestealer', 'lycan',
               'magnus', 'night_stalker', 'omniknight', 'phoenix', 'pudge', 'sand_king', 'slardar',
               'spirit_breaker', 'sven', 'tidehunter', 'timbersaw', 'tiny', 'treant_protector', 'tusk',
               'underlord', 'undying', 'wraith_king']
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
    puts @tester.hero
  end

  def test_item
    assert_match(/\w+/, @tester.item)
    puts @tester.item
  end

  def test_team
    assert_match(/\w+/, @tester.team)
    puts @tester.team
  end

  def test_player
    assert_match(/\w+/, @tester.player)
    puts @tester.player
  end

  def test_heroes_quotes
    @heroes.each do |hero|
      assert_match(/\w+/, @tester.quote(hero))
      puts(hero.upcase + ': ' + @tester.quote(hero))
    end
  end

end
