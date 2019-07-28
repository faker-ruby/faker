# Faker::Time

```ruby
# Random date between dates
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
# You can install the as-duration gem to facilitate time manipulation like 45.minutes + 2.hours
# (not needed if you already have activesupport, which is included with Rails)
require 'as-duration'
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between(from: 2.days.ago, to: Date.today, period: :midnight) #=> "2014-09-20 00:40:14 -0700"

# Random time in the future (up to maximum of N days)
Faker::Time.forward(days: 23, period: :morning) # => "2014-09-26 06:54:47 -0700"

# Random time in the past (up to maximum of N days)
Faker::Time.backward(days: 14, period: :evening) #=> "2014-09-17 19:56:33 -0700"
```
