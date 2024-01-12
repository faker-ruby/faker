# Faker::Internet

```ruby
# Keyword arguments: name, username, email, password, domain_name, user_agent, uuid etc...
Faker::Internet.user #=> { username: 'alexie', email: 'trudie@grant.test' }
Faker::Internet.user('username', 'email', 'password') #=> { username: 'alexie', email: 'gayle@kohler.test', password: 'DtEf9P8wS31iMyC' }

# Keyword arguments: name, separators, domain
Faker::Internet.email #=> "eliza@mann.test"
Faker::Internet.email(name: 'Nancy') #=> "nancy@terry.test"
Faker::Internet.email(name: 'Janelle Santiago', separators: ['+']) #=> "janelle+santiago@becker.example"
Faker::Internet.email(domain: 'gmail.com')  #=> "foo@gmail.com"
Faker::Internet.email(name: 'sam smith', separators: ['-'], domain: 'test') #=> "sam-smith@test.test"

# Keyword arguments: specifier, separators
Faker::Internet.username #=> "alexie"
Faker::Internet.username(specifier: 'Nancy') #=> "nancy"
Faker::Internet.username(specifier: 'Nancy Johnson', separators: %w(. _ -)) #=> "johnson-nancy"

# Keyword arguments: min_length, max_length
Faker::Internet.username(specifier: 5..8)

# Keyword arguments: min_length
Faker::Internet.username(specifier: 8)

# Keyword arguments: min_length, max_length, mix_case, special_characters
# Default configuration is mix_case: true && special_characters: false
Faker::Internet.password #=> "Vg5mSvY1UeRg7"
Faker::Internet.password(min_length: 8) #=> "YfGjIk0hGzDqS0"
Faker::Internet.password(min_length: 10, max_length: 20) #=> "EoC9ShWd1hWq4vBgFw"
# min_length must be at least 1 if mix_case: false && special_characters: true
Faker::Internet.password(min_length: 10, max_length: 20, mix_case: false, special_characters: true) #=> "$1109mw31h8359jm0!oo"
# min_length must be at least 2 if mix_case: true && special_characters: false
Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) #=> "3k5qS15aNmG"
# min_length must be at least 3 if mix_case: true && special_characters: true
Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) #=> "*%NkOnJsH4"

# Keyword arguments: subdomain, domain
Faker::Internet.domain_name #=> "herzog.example"
Faker::Internet.domain_name(subdomain: true) #=> "tillman.kohler.test"
Faker::Internet.domain_name(subdomain: true, domain: 'faker') #=> "ebert.faker.example"
Faker::Internet.domain_name(domain: 'faker-ruby.org')  #=> "faker-ruby.org"
Faker::Internet.domain_name(subdomain: true, domain: 'faker-ruby.org') #=> "foo.faker-ruby.org"
Faker::Internet.domain_name(subdomain: true, domain: 'faker.faker-ruby.org')  #=> "faker.faker-ruby.org"

Faker::Internet.domain_word #=> "haleyziemann"

# Keyword arguments: safe ('example' and 'test' suffixes)
Faker::Internet.domain_suffix #=> "info"
Faker::Internet.domain_suffix(safe: true) #=> "example"

Faker::Internet.ip_v4_address #=> "24.29.18.175"

# Private IP range according to RFC 1918 and 127.0.0.0/8 and 169.254.0.0/16.
Faker::Internet.private_ip_v4_address #=> "10.0.0.1"

# Guaranteed not to be in the ip range from the private_ip_v4_address method.
Faker::Internet.public_ip_v4_address #=> "24.29.18.175"

Faker::Internet.ip_v4_cidr #=> "24.29.18.175/21"

Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

Faker::Internet.ip_v6_cidr #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df/78"

# Keyword arguments: prefix
Faker::Internet.mac_address #=> "e6:0d:00:11:ed:4f"
Faker::Internet.mac_address(prefix: '55:44:33') #=> "55:44:33:02:1d:9b"

# Keyword arguments: host, path, scheme
Faker::Internet.url #=> "http://treutel.test/demarcus"
Faker::Internet.url #=> "http://ullrich.example/fritz_braun"
Faker::Internet.url(host: 'faker') #=> "http://faker/nakita"
Faker::Internet.url(host: 'example.com') #=> "http://example.com/clotilde.swift"
Faker::Internet.url(host: 'example.com', path: '/foobar.html') #=> "http://example.com/foobar.html"

# Keyword arguments: words, glue
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug(words: 'foo bar') #=> "foo.bar"
Faker::Internet.slug(words: 'foo bar', glue: '-') #=> "foo-bar"

# Keyword arguments: vendor
Faker::Internet.user_agent #=> "Mozilla/5.0 (compatible; MSIE 9.0; AOL 9.7; AOLBuild 4343.19; Windows NT 6.1; WOW64; Trident/5.0; FunWebProducts)"
Faker::Internet.user_agent(vendor: :firefox) #=> "Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0"

# Keyword arguments: vendor
Faker::Internet.bot_user_agent #=> "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
Faker::Internet.bot_user_agent(vendor: :duckduckbot) #=> "Mozilla/5.0 (compatible; DuckDuckBot-Https/1.1; https://duckduckgo.com/duckduckbot)"

Faker::Internet.uuid #=> "929ef6ef-b11f-38c9-111b-accd67a258b2"
```
