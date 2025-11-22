`Faker::Twitter` has been deprecated in favor of `Faker::X`. While it's still maintained, its docs can be found at [Faker::Twitter](#fakertwitter).

# Faker::X

Generates approximate X (previously Twitter) user and tweet objects, based on X's API v2 responses.

The generators are not a comprehensive match of the API. However, they are enough to create a demo app using X’s user or tweet data, for example.

## Faker::X.user

Produces a random X user based on X's v2 API:

```ruby
Faker::X.user =>
{
  data: [
    {
      author_id: "5688134805624042468",
      id: "2007502004337242257",
      text: "Qui sint magni vel."
    }
  ],
  includes: {
    users: [
      {
        public_metrics: {
          followers_count: 1000,
          following_count: 77,
          tweet_count: 4642,
          listed_count: 704
        },
        username: "lilian",
        pinned_tweet_id: "1702549793917523469",
        entities: {
          url: {
            urls: [ { url: "https://t.co/0iz5wx1ysh", expanded_url: "http://example.com/stuart", display_url: "example.com/stuart" }]
          },
          description: { hashtags: [{tag: "Adipisci"}] }
        },
        description: "Est est laborum dolores.",
        name: "Kimberli Ullrich Jr.",
        verified: false,
        location: "104.82.135.3",
        id: "5688134805624042468",
        protected: false,
        url: "https://t.co/lqsqf67cx5",
        profile_image_url: "https://robohash.org/990174365255127568.png?size=48x48&set=set1",
        created_at: "2018-07-11T00:00:00+00:00"
      }
    ]
  }
}
```

## Faker::X.tweet

Produces a random X tweet with default attributes. Available extensions can be returned with `include_media` and `include_user`:

```ruby
# Keyword arguments: include_user, include_media
Faker::Twitter.tweet #=> { data: [{:id=>"8821452687517076614", :text=>"Ea et laboriosam vel non.",...
Faker::Twitter.tweet(include_user: true) # Includes user attributes
Faker::Twitter.tweet(include_media: true) # Includes media (photo) attributes
```

Example outputs:

```ruby
Faker::X.tweet =>
{
  data: [{
    id: "5530076569335337477",
    text: "Omnis facere ullam velit.",
    lang: "ja",
    conversation_id: "5530076569335337477",
    created_at: "2009-02-21T07:00:00.000Z",
    author_id: "2788144046134446176",
    public_metrics: {
      retweet_count: 95,
      reply_count: 3,
      like_count: 10,
      quote_count: 3
    },
    possibly_sensitive: false,
    entities: {
      urls: [{
        start: 0,
        end: 5,
        url: "https://t.co/t6o3lav9z1",
        expanded_url: "http://example.com/errol.upton",
        display_url: "example.com/errol.upton"
      }],
      hashtags: [{
        start: 0,
        end: 5,
        tag: "Odit"
      }]
    }
  }]
}
```

With additional fields:

```ruby
Faker::X.tweet(include_media: true, include_user: true) =>
{
  data: [{
    id: "5340086698567112794",
    text: "Esse nulla minus qui.",
    lang: "en",
    conversation_id: "5340086698567112794",
    created_at: "2009-07-04T06:00:00.000Z",
    author_id: "5156189524741091965",
    public_metrics: {
      retweet_count: 56,
      reply_count: 2,
      like_count: 23,
      quote_count: 1
    },
    possibly_sensitive: false,
    entities: {
      urls: [{
        start: 0,
        end: 5,
        url: "https://t.co/mqplf9rhpn",
        expanded_url: "http://example.com/mohamed_koelpin",
        display_url: "example.com/mohamed_koelpin"
      }],
      hashtags: [{
        start: 0,
        end: 5,
        tag: "Atque"
      }]
    },
    attachments: {
      media_keys: ["6992225089295851582"]
    }
  }],
  includes: {
    media: [{
      height: 526,
      media_key: "6992225089295851582",
      type: "photo",
      preview_image_url: "https://loremflickr.com/1064/600",
      width: 1571,
      alt_text: "Qui ratione magnam et."
    }],
    users: [{
      public_metrics: {
        followers_count: 467,
        following_count: 3,
        tweet_count: 9006,
        listed_count: 984
      },
      username: "gayle",
      pinned_tweet_id: "2282479924658708548",
      entities: {
        url: {
          urls: [{
            start: 0,
            end: 5,
            url: "https://t.co/69eytnuwwu",
            expanded_url: "http://example.com/werner",
            display_url: "example.com/werner"
          }]
        },
        description: {
          hashtags: [{
            start: 0,
            end: 5,
            tag: "Soluta"
          }]
        }
      },
      description: "Esse harum voluptatem voluptate.",
      name: "Elva Spinka",
      verified: false,
      location: "34.230.131.77",
      id: "2365736908578621112",
      protected: false,
      url: "https://t.co/pyuqky3gdl",
      profile_image_url: "https://robohash.org/2204799175591912732.png?size=48x48&set=set1",
      created_at: "2025-01-30T07:00:00.000Z"
    }]
  }
}
```

## Faker::X.screen_name

Produces a random screen_name:

```ruby
Faker::X.screen_name #=> "audreanne_hackett"
```

# Faker::Twitter

This generator has been deprecated. Please use `Faker::X` instead. Note that some attributes have been deprecated by [X's API](https://docs.x.com/x-api/migrate/data-format-migration).

Available since version 1.7.3.

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
# Keyword arguments: include_status, include_email
Faker::Twitter.user #=>  {:id=>8821452687517076614, :name=>"Lincoln Paucek", :screen_name=>"cody"...
Faker::Twitter.user(include_status: false) # Just get a user object with no embed status
Faker::Twitter.user(include_email: true) # Simulate an authenticated user with the email permission

# Keyword arguments: include_user, include_photo
Faker::Twitter.status #=> {:id=>8821452687517076614, :text=>"Ea et laboriosam vel non."...
Faker::Twitter.status(include_user: false) # Just get a status object with no embed user
Faker::Twitter.status(include_photo: true) # Includes entities for an attached image

Faker::Twitter.screen_name #=> "audreanne_hackett"
```
