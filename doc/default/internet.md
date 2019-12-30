# Faker::Internet

```ruby
# Keyword arguments: name, separators, domain
Faker::Internet.email #=> "eliza@mann.net"
Faker::Internet.email(name: 'Nancy') #=> "nancy@terry.biz"
Faker::Internet.email(name: 'Janelle Santiago', separators: '+') #=> janelle+santiago@becker.com"
Faker::Internet.email(domain: 'example') #=> alice@example.name"

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

# IP V4 adress
Faker::Internet.ip_v4_address #=> "24.29.18.175"
Faker::Internet.link_local_ip_v4_address #=> "169.254.0.1"
Faker::Internet.loopback_ip_v4_address #=> "127.0.0.1"
Faker::Internet.private_ip_v4_address #=> "10.0.0.1"
Faker::Internet.public_ip_v4_address #=> "24.29.18.175"

# IP V4 CIDR
Faker::Internet.ip_v4_cidr #=> "24.29.18.175/21"
Faker::Internet.link_local_ip_v4_cidr #=> "169.254.0.0/16" (immutable)
Faker::Internet.loopback_ip_v4_cidr #=> "127.0.0.0/8" (immutable)
Faker::Internet.private_ip_v4_uidr #=> "192.168.0.0/16"
Faker::Internet.public_ip_v4_cidr #=> "192.172.0.0/14"

# IP V6 adress
Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"
Faker::Internet.link_local_ip_v6_address #=> "fea9:9148:9719:27cf:075e:f437:c22f:4496"
Faker::Internet.loopback_ip_v6_address #=> "0000:0000:0000:0000:0000:0000:0000:0001"
Faker::Internet.private_ip_v6_address #=> "fc85:ca65:e1f4:a6ed:2751:b25e:09c6:c716"
Faker::Internet.public_ip_v6_address #=> "0064:ff9b:0000:0000:0000:0000:95e3:bad2"

# IP V6 CIDR
Faker::Internet.ip_v6_cidr #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df/78"
Faker::Internet.link_local_ip_v6_cidr #=> "fe80::/10" (immutable)
Faker::Internet.loopback_ip_v6_cidr #=> "fe80::/10" (immutable)
Faker::Internet.private_ip_v6_cidr #=> "fc00::/7"
Faker::Internet.public_ip_v6_cidr #=> "64:ff9b::/96"

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
