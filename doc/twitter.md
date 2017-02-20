# Faker::Twitter

Generate realistic Twitter user and status objects similar to what you would get back from the API.

```json
{
  "created_at": "Mon Dec 10 00:00:00 +0000 2012",
  "id": 8821452687517076614,
  "id_str": "8821452687517076614",
  "text": "Ea et laboriosam vel non.",
  // ...
}
```

```ruby
Faker::Twitter.user #=>  {:id=>8821452687517076614, :name=>"Lincoln Paucek", :screen_name=>"cody"...
Faker::Twitter.user(include_status: false) # Just get a user object with no embed status
Faker::Twitter.user(include_email: true) # Simulate an authenticated user with the email permission

Faker::Twitter.status #=> {:id=>8821452687517076614, :text=>"Ea et laboriosam vel non."...
Faker::Twitter.status(include_user: false) # Just get a status object with no embed user
Faker::Twitter.status(include_photo: true) # Includes entities for an attached image
```
