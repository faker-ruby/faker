# Faker::Internet

```ruby
# Keyword arguments: name, username, email, password, domain_name, user_agent, uuid etc... 
Faker::Internet.user #=> { username: 'alexie', email: 'alexie@example.net' }
Faker::Internet.user('username', 'email', 'password') #=> { username: 'alexie', email: 'alexie@example.net', password: 'DtEf9P8wS31iMyC' }

# Keyword arguments: name, separators
Faker::Internet.email #=> "eliza@mann.net"
Faker::Internet.email(name: 'Nancy') #=> "nancy@terry.biz"
Faker::Internet.email(name: 'Janelle Santiago', separators: '+') #=> "janelle+santiago@becker.com"
Faker::Internet.email(domain: 'example') #=> "alice@example.name"

# Keyword arguments: name
Faker::Internet.free_email #=> "freddy@gmail.com"
Faker::Internet.free_email(name: 'Nancy') #=> "nancy@yahoo.com"

# Generates an RFC 2606 compliant fake email, which means it will never deliver successfully
# Keyword arguments: name
Faker::Internet.safe_email #=> "christelle@example.org"
Faker::Internet.safe_email(name: 'Nancy') #=> "nancy@example.net"

# Keyword arguments: specifier, separators
Faker::Internet.username #=> "alexie"
Faker::Internet.username(specifier: 'Nancy') #=> "nancy"
Faker::Internet.username(specifier: 'Nancy Johnson', separators: %w(. _ -)) #=> "johnson-nancy"

# Keyword arguments: min_length, max_length
Faker::Internet.username(specifier: 5..8)

# Keyword arguments: min_length
Faker::Internet.username(specifier: 8)

# Keyword arguments: min_length, max_length, mix_case, special_characters
Faker::Internet.password #=> "Vg5mSvY1UeRg7"
Faker::Internet.password(min_length: 8) #=> "YfGjIk0hGzDqS0"
Faker::Internet.password(min_length: 10, max_length: 20) #=> "EoC9ShWd1hWq4vBgFw"
Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) #=> "3k5qS15aNmG"
Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) #=> "*%NkOnJsH4"

# Keyword arguments: subdomain, domain
Faker::Internet.domain_name #=> "effertz.info"
Faker::Internet.domain_name(domain: "example") #=> "example.net"
Faker::Internet.domain_name(subdomain: true, domain: "example") #=> "horse.example.org"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"

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
Faker::Internet.url #=> "http://thiel.com/chauncey_simonis"
Faker::Internet.url(host: 'example.com') #=> "http://example.com/clotilde.swift"
Faker::Internet.url(host: 'example.com', path: '/foobar.html') #=> "http://example.com/foobar.html"

# Keyword arguments: words, glue
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug(words: 'foo bar') #=> "foo.bar"
Faker::Internet.slug(words: 'foo bar', glue: '-') #=> "foo-bar"

# Keyword arguments: vendor
Faker::Internet.user_agent #=> "Mozilla/5.0 (compatible; MSIE 9.0; AOL 9.7; AOLBuild 4343.19; Windows NT 6.1; WOW64; Trident/5.0; FunWebProducts)"
Faker::Internet.user_agent(vendor: :firefox) #=> "Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0"

Faker::Internet.uuid #=> "929ef6ef-b11f-38c9-111b-accd67a258b2"
```
