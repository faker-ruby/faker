# Faker::Time

```ruby
# Random Time between two times
Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"
 # Random Stringified time between two times, formatted to the specified I18n format
# (Examples are from a Rails console with rails-i18n 5.1.1 defaults loaded)
I18n.locale = 'en-US'
Faker::Time.between(DateTime.now - 1, DateTime.now, :default) #=> "Tue, 16 Oct 2018 10:48:27 AM -05:00"
Faker::Time.between(DateTime.now - 1, DateTime.now, :short) #=> "15 Oct 10:48 AM"
Faker::Time.between(DateTime.now - 1, DateTime.now, :long) #=> "October 15, 2018 10:48 AM"
 I18n.locale = 'ja'
Faker::Time.between(DateTime.now - 1, DateTime.now, :default) #=> "2018/10/15 10:48:27"
Faker::Time.between(DateTime.now - 1, DateTime.now, :short) #=> "18/10/15 10:48"
Faker::Time.between(DateTime.now - 1, DateTime.now, :long) #=> "2018年10月16日(火) 10時48分27秒 -0500"
 # Random Time between two dates, within specified part of the day
# You can install the as-duration gem to facilitate time manipulation like 45.minutes + 2.hours
# (not needed if you already have activesupport, which is included with Rails)
require 'as-duration'
 Faker::Time.between_dates(2.days.ago, Date.today, :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between_dates(2.days.ago, Date.today, :midnight) #=> "2014-09-20 00:40:14 -0700"
 # Random Time in the future (up to maximum of N days)
Faker::Time.forward(23, :morning) # => "2014-09-26 06:54:47 -0700"
 # Random Time in the past (up to maximum of N days)
Faker::Time.backward(14, :evening) #=> "2014-09-17 19:56:33 -0700"
 # Random Stringified time in the past, future, or between dates, formatted to the specified I18n format
Faker::Time.backward(5, :morning, :short) #=> "14 Oct 07:44"
Faker::Time.forward(5, :evening, :long) #=> "October 21, 2018 20:47"
Faker::Time.between_dates(5.days.ago, 5.days.from_now, :afternoon, :default) #=> "Fri, 19 Oct 2018 15:17:46 -0500"
```
