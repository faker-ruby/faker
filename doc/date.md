# Faker::Date

```ruby
# Random date between dates
Faker::Date.between(2.days.ago, Date.today) #=> "Wed, 24 Sep 2014"

# Random date between dates except for certain date
Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) #=> "Wed, 24 Sep 2014"

# Random date in the future (up to maximum of N days)
Faker::Date.forward(23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
Faker::Date.backward(14) #=> "Fri, 19 Sep 2014"
```
