# Faker::Json

**shallow_json(width_int, options_hash)** -> JSON formated string

 Takes a width_int and options_hash where the number of key value pairs in the
 returned JSON string is equal to the width_int.

 `options_hash = {key: Class.method, value: Class.method}` where Class is
 any class in the Faker gem.  For example if you want random names for keys
 and random Star Wars quotes for values you would write the options_hash as follows
 ```ruby
 options_hash = { key: 'Name.first_name', value: 'StarWars.quote' }
 ```

 It is important to note that you do not need to append your Faker Gem Class calls
 with `Faker::`

```ruby
Faker::Json.shallow_json(3, key: 'RockBand.name', value: 'Seinfeld.quote')
# =>
{"Parliament Funkadelic":"They're real, and they're spectacular.",
  "Fleetwood Mac":"I'm not a lesbian. I hate men, but I'm not a lesbian.",
  "The Roots":"It became very clear to me sitting out there today that every decision
  I've made in my entire life has been wrong. My life is the complete opposite of everything
  I want it to be. Every instinct I have, in every aspect of life, be it something to wear,
  something to eat - it's all been wrong."}
```

**add_depth_to_json(JSON, width_int, options_hash)** -> JSON

Functions exactly as `Json#shallow_json()` except it takes in a JSON as an
additional argument and returns that JSON with new generated nested JSONs in
place of the lowest nested values.  It is important to note that the JSON must
be a JSON and not a hash.

```ruby
json = Faker::Json.shallow_json(3, key: 'Name.first_name', value: 'Name.last_name')
puts json # =>
{"Alisha":"Olson","Everardo":"DuBuque","Bridgette":"Turner"}

json2 = Faker::Json.add_depth_to_json(json, 2, key: 'Name.first_name', value: 'Name.last_name')
puts json2 # =>
{"Alisha":{"Daisy":"Trantow","Oda":"Haag"},
 "Everardo":{"Javier":"Marvin","Eliseo":"Schuppe"},
 "Bridgette":{"Jorge":"Kertzmann","Lelah":"MacGyver"}}

 json3 = Faker::Json.add_depth_to_json(json2, 4, key: 'Name.first_name', value: 'Name.last_name')
 puts json3 # =>
 {"Alisha":
   {"Daisy":
     {"Bulah":"Wunsch","Cristian":"Champlin","Lester":"Bartoletti","Greg":"Jacobson"},
    "Oda":
      {"Salvatore":"Kuhlman","Aubree":"Okuneva","Larry":"Schmitt","Velva":"Gibson"}},
  "Everardo":
    {"Javier":
      {"Eduardo":"Orn","Laila":"Kub","Thad":"Legros","Dion":"Wilderman"},
    "Eliseo":
      {"Olin":"Hilpert","Marisa":"Greenfelder","Karlee":"Schmitt","Judd":"Larkin"}},
  "Bridgette":
    {"Jorge":
      {"Eloy":"Pfeffer","Kody":"Hansen","Paxton":"Lubowitz","Abe":"Lesch"},
    "Lelah":
      {"Rick":"Wiza","Bonita":"Bayer","Gardner":"Auer","Felicity":"Abbott"}}}
```
