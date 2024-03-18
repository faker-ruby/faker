# frozen_string_literal: true

# rubocop:disable Security/Eval,Style/EvalWithLocation

require 'benchmark'
require 'faker'

namespace :benchmark do
  desc 'Benchmarking all methods'
  task :all_methods do
    all_methods = BenchmarkHelper.all_methods
    count = all_methods.count

    Benchmark.bmbm do |x|
      x.report("Number of generators: #{count}") do
        100.times do
          all_methods.each { |method_name| eval(method_name) }
        end
      end
    end
  end

  desc 'Comparing loading translations from YML vs. JSON'
  task :compare_loading_yml_vs_json do
    Benchmark.bmbm do |x|
      x.report('YML') do
        100.times do
          YAML.load_file(File.expand_path("#{File.dirname(__FILE__)}/../lib/locales/es-MX.yml"))
        end
      end

      x.report('JSON') do
        100.times do
          JSON.load_file("#{File.dirname(__FILE__)}/../test/fixtures/locales/es-MX.json")
        end
      end
    end
  end
end

class BenchmarkHelper
  class << self
    def all_methods
      subclasses.map do |subclass|
        subclass_methods(subclass).flatten
      end.flatten.sort
    end

    def subclasses
      Faker.constants.delete_if do |subclass|
        %i[Base Bank Books Cat Char Base58 ChileRut CLI Config Creature Date Dog DragonBall Dota ElderScrolls Fallout Games GamesHalfLife HeroesOfTheStorm Internet JapaneseMedia LeagueOfLegends Movies Myst Overwatch OnePiece Pokemon Religion Sports SwordArtOnline TvShows Time VERSION Witcher WorldOfWarcraft Zelda].include?(subclass)
      end.sort
    end

    def subclass_methods(subclass)
      eval("Faker::#{subclass}.public_methods(false) - Faker::Base.public_methods(false)").sort.map do |method|
        "Faker::#{subclass}.#{method}"
      end.sort
    end
  end
end
# rubocop:enable Security/Eval,Style/EvalWithLocation
