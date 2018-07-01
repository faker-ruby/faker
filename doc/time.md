# Faker::Time

```ruby
# Random date between dates
Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
# You can install the as-duration gem to facilitate time manipulation like 45.minutes + 2.hours
# (not needed if you already have activesupport, which is included with Rails)
require 'as-duration'
Faker::Time.between(2.days.ago, Date.today, :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between(2.days.ago, Date.today, :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between(2.days.ago, Date.today, :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between(2.days.ago, Date.today, :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between(2.days.ago, Date.today, :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between(2.days.ago, Date.today, :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between(2.days.ago, Date.today, :midnight) #=> "2014-09-20 00:40:14 -0700"

# Random time in the future (up to maximum of N days)
Faker::Time.forward(23, :morning) # => "2014-09-26 06:54:47 -0700"

# Random time in the past (up to maximum of N days)
Faker::Time.backward(14, :evening) #=> "2014-09-17 19:56:33 -0700"

# Option by default is :all, and it will return a DateTime object
# If you want to get a Time object between 2 times you have to specify the option :between
# Random time in the las 3 hours
Faker::Time.between(3.hours.ago, Time.now, :between) #=> "Wed, 20 Jun 2018 10:30:02 UTC +00:00"
```

### NOTE

* Faker.Time.between will be deprecated. After deprecation it will only return Time objects. For DateTime objects there wil be a new class Faker::DateTime