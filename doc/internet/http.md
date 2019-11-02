# Faker::Internet::HTTP

Available since version 2.7.0.

# Keyword arguments: group
Faker::Internet::HTTP.http_status_code #=> 418
Faker::Internet::HTTP.http_status_code(group: :information) #=> 102
Faker::Internet::HTTP.http_status_code(group: :successful) #=> 200
Faker::Internet::HTTP.http_status_code(group: :redirect) #=> 306
Faker::Internet::HTTP.http_status_code(group: :client_error) #=> 451
Faker::Internet::HTTP.http_status_code(group: :server_error) #=> 502