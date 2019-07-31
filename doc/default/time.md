# Faker::Time

```ruby
# Random Time between two times
# Keyword arguments: from, to, format
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) #=> "2014-09-18 12:30:59 -0700"
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) #=> "Tue, 16 Oct 2018 10:48:27 AM -05:00"
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) #=> "15 Oct 10:48 AM"
Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) #=> "October 15, 2018 10:48 AM"

# Random Time between two dates, within specified part of the day
# Keyword arguments: from, to, period
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) #=> "2014-09-19 07:03:30 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day) #=> "2014-09-18 16:28:13 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :night) #=> "2014-09-20 19:39:38 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning) #=> "2014-09-19 08:07:52 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :afternoon) #=> "2014-09-18 12:10:34 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :evening) #=> "2014-09-19 20:21:03 -0700"
Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :midnight) #=> "2014-09-20 00:40:14 -0700"
Faker::Time.between_dates(from: Date.today - 5, to: Date.today + 5, period: :afternoon, format: :default) #=> "Fri, 19 Oct 2018 15:17:46 -0500"

# Random Time in the future (up to maximum of N days)
# Keyword arguments: days, period, format
Faker::Time.forward(days: 23, period: :morning) # => "2014-09-26 06:54:47 -0700"
Faker::Time.forward(days: 5,  period: :evening, format: :long) #=> "October 21, 2018 20:47"

# Random Time in the past (up to maximum of N days)
# Keyword arguments: days, period, format
Faker::Time.backward(days: 14, period: :evening) #=> "2014-09-17 19:56:33 -0700"
Faker::Time.backward(days: 5, period: :morning, format: :short) #=> "14 Oct 07:44"
```
