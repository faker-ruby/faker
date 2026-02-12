# Faker::HTTP

Available since version next.

# Keyword arguments: group
```ruby
Faker::HTTP.status_code #=> 418
Faker::HTTP.status_code(group: :information) #=> 102
Faker::HTTP.status_code(group: :successful) #=> 200
Faker::HTTP.status_code(group: :redirect) #=> 306
Faker::HTTP.status_code(group: :client_error) #=> 451
Faker::HTTP.status_code(group: :server_error) #=> 502
```