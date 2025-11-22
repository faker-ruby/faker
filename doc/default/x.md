`Faker::Twitter` has been deprecated in favor of `Faker::X`. While it's still maintained, its docs can be found at [Faker::Twitter](#fakertwitter).

# Faker::X

Generates approximate X (previously Twitter) user and tweet objects, based on X's API v2 responses.

The generators are not a comprehensive match of the API. However, they are enough to create a demo app using X’s user or tweet data, for example.

## Faker::X.user

Produces a random X user based on X's v2 API:

```ruby
Faker::X.user => {
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
  data: [
    {
      id: "7999525033982409544",
      text: "Molestias non possimus voluptatem.",
      lang: "VA",
      conversation_id: "7999525033982409544",
      created_at: "2011-03-16T00:00:00+00:00",
      public_metrics: {retweet_count: 69, reply_count: 17, like_count: 21, quote_count: 8},
      possibly_sensitive: false,
      entities: {
        url: { urls: [{url: "https://t.co/gz4z8dvybe", expanded_url: "http://example.com/salley.grant", display_url: "example.com/salley.grant"}] },
        description: { hashtags: [{tag: "Veritatis"}] }
      },
      in_reply_to_user_id: false
    }
  ]
}
```

With additional fields:

```ruby
Faker::X.tweet(include_media: true, include_user: true) =>

{
  data: [
    {
      id: "8194812886422142201",
      text: "Eos sed quibusdam aperiam.",
      lang: "AU",
      conversation_id: "8194812886422142201",
      created_at: "2017-10-24T00:00:00+00:00",
      public_metrics: {retweet_count: 87, reply_count: 19, like_count: 14, quote_count: 4},
      possibly_sensitive: false,
      entities: {
        url: { urls: [{url: "https://t.co/h9pi5f7q7j", expanded_url: "http://example.com/angelica_moore", display_url: "example.com/angelica_moore"}] },
        description: { hashtags: [{tag: "Saepe"}] }
      },
      in_reply_to_user_id: false},
      { attachments: {media_keys: ["466995304449852781"]}
    }
  ],
 includes: {
    media: [
      {
        type: "photo",
        indices: [103, 126],
        height: 446,
        media_key: "466995304449852781",
        preview_image_url: "https://loremflickr.com/1064/600",
        width: 1321,
        url: "https://t.co/s3j25etwdj",
        expanded_url: "https://loremflickr.com/1064/600",
        display_url: "loremflickr.com/1064/600",
        alt_text: "Et possimus repudiandae tenetur."
      }
    ],
    users: [
      {
        public_metrics: {followers_count: 488, following_count: 180, tweet_count: 6368, listed_count: 209},
        username: "shante",
        pinned_tweet_id: "7350697183426089357",
        entities: {
          url: { urls: [{url: "https://t.co/cxwehs7i1z", expanded_url: "http://example.com/kirstie.reilly", display_url: "example.com/kirstie.reilly"}] },
          description: { hashtags: [{tag: "Rem"}] }
        },
        description: "Ipsa nihil velit adipisci.",
        name: "Jerome Heathcote III",
        verified: false,
        location: "222.70.154.120",
        id: "5679269981284870916",
        protected: false,
        url: "https://t.co/5xyjlv6ckv",
        profile_image_url: "https://robohash.org/4106878141532070549.png?size=48x48&set=set1",
        created_at: "2019-01-27T00:00:00+00:00"
      }
    ]
  }
}
```

## Faker::X.screen_name

Produces a random screen_name:

```ruby
Faker::Twitter.screen_name #=> "audreanne_hackett"
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
