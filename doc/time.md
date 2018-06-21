# Faker::Time

```ruby
# It returns a Time object >= parameter 'from' and <= parameter 'to'
Faker::Time.between(from, to)

# Random date between dates
Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2018-06-21 12:30:59 -0700"

# Random date between times
from = Time.new(2014, 09, 18, 12, 0, 0, "-07:00") #=> "2014-09-18 12:00:00 -0700"
to = Time.new(2014, 09, 19, 12, 0, 0, "-07:00")   #=> "2014-09-19 12:00:00 -0700"
Faker::Time.between(from, to)                     #=> "2014-09-18 22:45:06 -0700"

# You can install the as-duration gem to facilitate time manipulation like 45.minutes + 2.hours
# (not needed if you already have activesupport, which is included with Rails)
require 'as-duration'
Faker::Time.between(5.minutes.ago, 5.minutes.from_now) #=> "2018-06-21 16:03:42 -0700"
Faker::Time.between(15.days.ago, Time.now)             #=> "2018-06-13 09:37:12 -0700"
Faker::Time.between(Time.now, 2.months.from_now)       #=> "2018-08-11 16:03:42 -0700"


# Random time in the future (within specified part of the day) (up to maximum of N days)
Faker::Time.forward(23, :morning) # => "2014-09-26 06:54:47 -0700"

# Random time in the past (within specified part of the day) (up to maximum of N days)
Faker::Time.backward(14, :evening) #=> "2014-09-17 19:56:33 -0700"

# Possible 'part of the day' options for methods forward and backward:
:all #=> Option by default
:day
:night
:morning
:afternoon
:evening
:midnight
```
