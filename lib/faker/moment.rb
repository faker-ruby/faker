require 'date'

module Faker
  class Moment

    # after is arbitrarily set to 1/1/1970 if not explicitly given
    # before is set to today if not set
    # both are inclusive
    def self.date(after = nil, before = nil)
      after ||= Date.new(1970, 1, 1)
      before ||= Date.today
      interval = (before - after).to_i
      after + rand(interval + 1)
    end

    # before and after are the number of seconds into the day and both are inclusive    
    # ondate is set to today if not explicitly stated
    def self.time(ondate = nil, after = nil, before = nil)
      ondate ||= Date.today
      after ||= 0
      before ||= (60 * 60 * 24)
      interval = (before - after).to_i
      Time.gm(ondate.year, ondate.month, ondate.day) + after + rand(interval + 1)
    end

  end
end
