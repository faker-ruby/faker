# Faker::Date

```ruby
# Random date between dates
Faker::Date.between(from: 2.days.ago, to: Date.today) #=> "Wed, 24 Sep 2014"

# Random date between dates except for certain date
Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) #=> "Wed, 24 Sep 2014"

# Random date in the future (up to maximum of N days)
Faker::Date.forward(days: 23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
Faker::Date.backward(days: 14) #=> "Fri, 19 Sep 2014"

# Random birthday date (maximum age between 18 and 65)
Faker::Date.birthday(min_age: 18, max_age: 65) #=> "Mar, 28 Mar 1986"
```
