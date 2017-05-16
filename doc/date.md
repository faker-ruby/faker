# Faker::Date

```ruby
# Random date between dates
Faker::Date.between("2012-03-15", Date.today) #=> #<Date: 2012-11-02 ((2456234j,0s,0n),+0s,2299161j)>

# Random date between dates except for certain date
Faker::Date.between_except(Date.new(2015, 04, 23), Date.new(2019, 06, 07), Date.today) #=> #<Date: 2017-11-02 ((2456234j,0s,0n),+0s,2299161j)>

# Random date in the future (up to maximum of N days)
Faker::Date.forward(50) # => #<Date: 2017-06-02 ((2457907j,0s,0n),+0s,2299161j)>

# Random date in the past (up to maximum of N days)
Faker::Date.backward(14) #=> #<Date: 2017-05-02 ((2457907j,0s,0n),+0s,2299161j)>

# Random birthday date. The returned Date will be such that a person born on that date will currently
# be between x and y years old. x and y are integers
Faker::Date.birthday(5, 8) # => #<Date: 2009-05-24 ((2454976j,0s,0n),+0s,2299161j)>
```
