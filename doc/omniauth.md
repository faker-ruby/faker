Faker::Omniauth

Available since version 1.8.0.

[Omniauth](https://github.com/omniauth/omniauth) is a library that standardizes multi-provider authentication for web applications.  Each of the following methods will return a randomized hash that mimics the hash returned by each of these omniauth strategies.

```ruby
Faker::Omniauth.google #=>
{
  :provider => "google_oauth2",
  :uid => "123456789",
  :info => {
    :name => "John Doe",
    :email => "john.doe@example.com",
    :first_name => "John",
    :last_name => "Doe",
    :image => "https://lh3.googleusercontent.com/url/photo.jpg"
  },
  :credentials => {
      :token => "token",
      :refresh_token => "another_token",
      :expires_at => 1354920555,
      :expires => true
  },
  :extra => {
    :raw_info => {
      :sub => "123456789",
      :email => "john.doe@example.com",
      :email_verified => true,
      :name => "John Doe",
      :given_name => "John",
      :family_name => "Doe",
      :profile => "https://plus.google.com/123456789",
      :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
      :gender => "male",
      :birthday => "0000-06-25",
      :locale => "en",
      :hd => "example.com"
    },
    :id_info => {
      "iss" => "accounts.google.com",
      "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
      "email_verified" => "true",
      "sub" => "10769150350006150715113082367",
      "azp" => "APP_ID",
      "email" => "jsmith@example.com",
      "aud" => "APP_ID",
      "iat" => 1353601026,
      "exp" => 1353604926,
      "openid_id" => "https://www.google.com/accounts/o8/id?id=ABCdfdswawerSDFDsfdsfdfjdsf"
    }
  }
}

Faker::Omniauth.facebook #=>
{
  provider: 'facebook',
  uid: '1234567',
  info: {
    email: 'joe_bloggs@example.com',
    name: 'Joe Bloggs',
    first_name: 'Joe',
    last_name: 'Bloggs',
    image: 'http://graph.facebook.com/1234567/picture?type=square',
    verified: true
  },
  credentials: {
    token: 'ABCDEF...',
    expires_at: 1321747205,
    expires: true
  },
  extra: {
    raw_info: {
      id: '1234567',
      name: 'Joe Bloggs',
      first_name: 'Joe',
      last_name: 'Bloggs',
      link: 'http://www.facebook.com/jbloggs',
      username: 'jbloggs',
      location: { id: '123456789', name: 'Palo Alto, California' },
      gender: 'male',
      email: 'joe_bloggs@example.com',
      timezone: -8,
      locale: 'en_US',
      verified: true,
      updated_time: '2011-11-11T06:21:03+0000',
    }
  }
}

Faker::Omniauth.twitter #=>
{
  :provider => "twitter",
  :uid => "123456",
  :info => {
    :nickname => "johnqpublic",
    :name => "John Q Public",
    :location => "Anytown, USA",
    :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
    :description => "a very normal guy.",
    :urls => {
      :Website => nil,
      :Twitter => "https://twitter.com/johnqpublic"
    }
  },
  :credentials => {
    :token => "a1b2c3d4...", # The OAuth 2.0 access token
    :secret => "abcdef1234"
  },
  :extra => {
    :access_token => "", # An OAuth::AccessToken object
    :raw_info => {
      :name => "John Q Public",
      :listed_count => 0,
      :profile_sidebar_border_color => "181A1E",
      :url => nil,
      :lang => "en",
      :statuses_count => 129,
      :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
      :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
      :location => "Anytown, USA",
      :time_zone => "Chicago",
      :follow_request_sent => false,
      :id => 123456,
      :profile_background_tile => true,
      :profile_sidebar_fill_color => "666666",
      :followers_count => 1,
      :default_profile_image => false,
      :screen_name => "",
      :following => false,
      :utc_offset => -3600,
      :verified => false,
      :favourites_count => 0,
      :profile_background_color => "1A1B1F",
      :is_translator => false,
      :friends_count => 1,
      :notifications => false,
      :geo_enabled => true,
      :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
      :protected => false,
      :description => "a very normal guy.",
      :profile_link_color => "2FC2EF",
      :created_at => "Thu Jul 4 00:00:00 +0000 2013",
      :id_str => "123456",
      :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
      :default_profile => false,
      :profile_use_background_image => false,
      :entities => {
        :description => {
          :urls => []
        }
      },
      :profile_text_color => "666666",
      :contributors_enabled => false
    }
  }
}

Faker::Omniauth.linkedin #=>
{
  "provider"=>"linkedin",
  "uid"=>"AbC123",
  "info"=> {
    "name"=>"John Doe",
    "email"=>"doe.john@example.com",
    "nickname"=>"John Doe",
    "first_name"=>"John",
    "last_name"=>"Doe",
    "location"=>"Greater Boston Area, US",
    "description"=>"Senior Developer, Hammertech",
    "image"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
    "phone"=>"null",
    "headline"=> "Senior Developer, Hammertech",
    "industry"=>"Internet",
    "urls"=>{
      "public_profile"=>"http://www.linkedin.com/in/johndoe"
    }
  },
  "credentials"=> {
    "token"=>"12312...",
    "secret"=>"aBc..."
  },
  "extra"=>
  {
    "access_token"=> {
      "token"=>"12312...",
      "secret"=>"aBc...",
      "consumer"=>nil, #<OAuth::Consumer>
      "params"=> {
        :oauth_token=>"12312...",
        :oauth_token_secret=>"aBc...",
        :oauth_expires_in=>"5183999",
        :oauth_authorization_expires_in=>"5183999",
      },
      "response"=>nil #<Net::HTTPResponse>
    },
   "raw_info"=> {
     "firstName"=>"Joe",
     "headline"=>"Senior Developer, Hammertech",
     "id"=>"AbC123",
     "industry"=>"Internet",
     "lastName"=>"Doe",
     "location"=> {"country"=>{"code"=>"us"}, "name"=>"Greater Boston Area"},
     "pictureUrl"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
     "publicProfileUrl"=>"http://www.linkedin.com/in/johndoe"
    }
  }
}

Faker::Omniauth.github #=>
{
  :provider =>"github",
  :uid =>"95144751",
  :info => {
    :nickname => "jackson-keeling",
    :email => "jackson.keeling@example.com",
    :name => "Jackson Keeling",
    :image => "https://placehold.it/300x300.png",
    :urls => {
      :GitHub => "https://github.com/jackson-keeling"
    }
  },
  :credentials => {
    :token => "9ea49b946a31b705a0168295a0caa195",
    :expires => false
  },
  :extra => {
    :raw_info => {
      :login => "jackson-keeling",
      :id => "95144751",
      :avatar_url => "https://placehold.it/300x300.png",
      :gravatar_id => "",
      :url => "https://api.github.com/users/jackson-keeling",
      :html_url => "https://github.com/jackson-keeling",
      :followers_url => "https://api.github.com/users/jackson-keeling/followers",
      :following_url => "https://api.github.com/users/jackson-keeling/following{/other_user}",
      :gists_url => "https://api.github.com/users/jackson-keeling/gists{/gist_id}",
      :starred_url => "https://api.github.com/users/jackson-keeling/starred{/owner}{/repo}",
      :subscriptions_url => "https://api.github.com/users/jackson-keeling/subscriptions",
      :organizations_url => "https://api.github.com/users/jackson-keeling/orgs",
      :repos_url => "https://api.github.com/users/jackson-keeling/repos",
      :events_url => "https://api.github.com/users/jackson-keeling/events{/privacy}",
      :received_events_url => "https://api.github.com/users/jackson-keeling/received_events",
      :type => "User",
      :site_admin => true,
      :name => "Jackson Keeling",
      :company => nil,
      :blog => nil,
      :location => "Paigeton, Massachusetts",
      :email => "jackson.keeling@example.com",
      :hireable => nil,
      :bio => nil,
      :public_repos => 263,
      :public_gists => 658,
      :followers => 294,
      :following => 865,
      :created_at => "2017-03-10T19:49:54+03:00",
      :updated_at => "2017-04-04T10:32:08+03:00"
    }
  }
}
```
