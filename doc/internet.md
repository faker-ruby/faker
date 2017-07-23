# Faker::Internet

```ruby
# Optional argument name=nil
Faker::Internet.email #=> "eliza@mann.net"

Faker::Internet.email('Nancy') #=> "nancy@terry.biz"

# Optional argument name=nil
Faker::Internet.free_email #=> "freddy@gmail.com"
## Count ##
# bg: 6 # de-AT: 3 # de: 7 # en-CA: 3 # en-IND: 3 # nep: 4 # en-PAK: 3 # es-MX: 4 # es: 3 # fr: 3 # it: 6 # ko: 4 # nl: 6 # pl: 3 # pt-BR: 5 # pt: 5 # ru: 6 # sk: 3 # tr: 3 # uk: 7 

Faker::Internet.free_email('Nancy') #=> "nancy@yahoo.com"

# Optional argument name=nil
Faker::Internet.safe_email #=> "christelle@example.org"
## Count ##
# tr: dynamic 

Faker::Internet.safe_email('Nancy') #=> "nancy@example.net"

# Optional arguments specifier=nil, separators=%w(. _)
Faker::Internet.user_name #=> "alexie"

Faker::Internet.user_name('Nancy') #=> "nancy"

Faker::Internet.user_name('Nancy Johnson', %w(. _ -)) #=> "johnson-nancy"

# Optional arguments: min_length=5, max_length=8
Faker::Internet.user_name(5..8)

# Optional arguments: min_length=8, max_length=16
Faker::Internet.password #=> "vg5msvy1uerg7"

Faker::Internet.password(8) #=> "yfgjik0hgzdqs0"

Faker::Internet.password(10, 20) #=> "eoc9shwd1hwq4vbgfw"

Faker::Internet.password(10, 20, true) #=> "3k5qS15aNmG"

Faker::Internet.password(10, 20, true, true) #=> "*%NkOnJsH4"

Faker::Internet.domain_name #=> "effertz.info"

Faker::Internet.fix_umlauts('äöüß') #=> "aeoeuess"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"
## Count ##
# bg: 6 # da-DK: 3 # de-AT: 8 # de-CH: 9 # de: 7 # en-au-ocker: 6 # en-AU: 6 # en-CA: 7 # en-GB: 5 # en-IND: 8 # nep: 5 # en-NG: 10 # en-NZ: 11 # en-PAK: 8 # en-UG: 6 # en-US: 9 # en-ZA: 3 # es-MX: 7 # es: 5 # fr: 11 # it: 8 # ko: 8 # nb-NO: 4 # nl: 4 # pl: 5 # pt-BR: 7 # pt: 6 # ru: 6 # sk: 5 # sv: 5 # tr: 5 # uk: 60 # vi: 5 

Faker::Internet.ip_v4_address #=> "24.29.18.175"

# Private IP range according to RFC 1918 and 127.0.0.0/8 and 169.254.0.0/16.
Faker::Internet.private_ip_v4_address #=> "10.0.0.1"

# Guaranteed not to be in the ip range from the private_ip_v4_address method.
Faker::Internet.public_ip_v4_address #=> "24.29.18.175"

Faker::Internet.ip_v4_cidr #=> "24.29.18.175/21"

Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

Faker::Internet.ip_v6_cidr #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df/78"

# Optional argument prefix=''
Faker::Internet.mac_address #=> "e6:0d:00:11:ed:4f"
Faker::Internet.mac_address('55:44:33') #=> "55:44:33:02:1d:9b"

# Optional arguments: host=domain_name, path="/#{user_name}"
Faker::Internet.url #=> "http://thiel.com/chauncey_simonis"
Faker::Internet.url('example.com') #=> "http://example.com/clotilde.swift"
Faker::Internet.url('example.com', '/foobar.html') #=> "http://example.com/foobar.html"

# Optional arguments: words=nil, glue=nil
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug('foo bar') #=> "foo.bar"
Faker::Internet.slug('foo bar', '-') #=> "foo-bar"

# Optional argument: vendor=nil
Faker::Internet.user_agent #=> "Mozilla/5.0 (compatible; MSIE 9.0; AOL 9.7; AOLBuild 4343.19; Windows NT 6.1; WOW64; Trident/5.0; FunWebProducts)"
Faker::Internet.user_agent(:firefox) #=> "Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0"
```
