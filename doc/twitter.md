# Faker::Twitter

Generate realistic Twitter user and status objects like you would get back from the API.

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
Faker::Twitter.user(include_status: false)

Faker::Twitter.status #=> {:id=>8821452687517076614, :text=>"Ea et laboriosam vel non."...
Faker::Twitter.status(include_user: false)
```
