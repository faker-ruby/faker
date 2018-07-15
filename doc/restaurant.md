# Faker::Restaurant

```ruby
Faker::Restaurant.name #=> "Turkish Grill"

Faker::Restaurant.cuisine #=> "Southern/Soul"

Faker::Restaurant.description #=> "To provide an exceptional dining experience that satisfies our guests’ grown-up tastes by being a Cut-Above in everything we do."

Faker::Restaurant.review #=> "Overall, the evening was a smash and I am so glad there is a new location closer to my office!!"

#Optional argument option=:regular
Faker::Restaurant.hours #=> ["Sunday 11:00 AM to 11:30 PM", "Monday 11:00 AM to 11:30 PM", "Tuesday 9:30 AM to 10:30 PM", "Wednesday 11:30 AM to 10:00 PM", "Thursday 10:00 AM to 11:00 PM", "Friday 11:30 AM to 10:00 PM", "Saturday 11:30 AM to 11:00 PM"]

Faker::Restaurant.hours(:military) #=> ["Sunday 11:30 to 23:30", "Monday 11:00 to 23:00", "Tuesday 11:30 to 22:00", "Wednesday 9:00 to 22:30", "Thursday 9:00 to 21:00", "Friday 10:30 to 21:30", "Saturday 11:30 to 21:30"]
