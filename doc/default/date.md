# Faker::Date

```ruby
# Random date between dates
# Keyword arguments: from, to
Faker::Date.between(from: '2014-09-23', to: '2014-09-25') #=> #<Date: 2014-09-24>
# If used with Rails (the Active Support gem), additional options are available:
Faker::Date.between(from: 2.days.ago, to: Date.today) #=> #<Date: 2014-09-24>

# Random date between dates except for certain date
# Keyword arguments: from, to, excepted
Faker::Date.between_except(from: '2014-09-23', to: '2015-09-25', excepted: '2015-01-24') #=> #<Date: 2014-10-03>
# If used with Rails (the Active Support gem), additional options are available:
Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) #=> #<Date: 2014-10-03>

# Random date in the future (up to maximum of N days)
# Keyword arguments: days
Faker::Date.forward(days: 23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
# Keyword arguments: days
Faker::Date.backward(days: 14) #=> "Fri, 19 Sep 2014"

# Random birthday date (maximum age between 18 and 65)
# Keyword arguments: min_age, max_age
Faker::Date.birthday(min_age: 18, max_age: 65) #=> "Mar, 28 Mar 1986"

# Random date in current year
Faker::Date.in_date_period #=> #<Date: 2019-09-01>

# Random date for range of year 2018 and month 2
# Keyword arguments: year, month
Faker::Date.in_date_period(year: 2018, month: 2) #=> #<Date: 2018-02-26>

# Random date for range of current year and month 2
# Keyword arguments: month
Faker::Date.in_date_period(month: 2) #=> #<Date: 2019-02-26>

```
