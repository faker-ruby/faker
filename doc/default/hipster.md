# Faker::Hipster

Adapted from [Hipster Ipsum](http://hipsum.co/)

```ruby
Faker::Hipster.word #=> "irony"

# Keyword arguments: number, supplemental, spaces_allowed
Faker::Hipster.words #=> ["pug", "pitchfork", "chia"]
Faker::Hipster.words(number: 4) #=> ["ugh", "cardigan", "poutine", "stumptown"]
Faker::Hipster.words(number: 4, supplemental: true) #=> ["iste", "seitan", "normcore", "provident"]
Faker::Hipster.words(number: 4, supplemental: true, spaces_allowed: true) #=> ["qui", "magni", "craft beer", "est"]

# Keyword arguments: word_count, supplemental, random_words_to_add, open_compounds_allowed
Faker::Hipster.sentence #=> "Park iphone leggings put a bird on it."
Faker::Hipster.sentence(word_count: 3) #=> "Pour-over swag godard."
Faker::Hipster.sentence(word_count: 3, supplemental: true) #=> "Beard laboriosam sequi celiac."
Faker::Hipster.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) #=> "Bitters retro mustache aesthetic biodiesel 8-bit."
Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 4) #=> "Occaecati deleniti messenger bag meh crucifix autem."
Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: true) #=> "Kale chips nihil eos."
Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: false) #=> "Dreamcatcher umami fixie."

# Keyword arguments: number, supplemental
Faker::Hipster.sentences #=> ["Godard pitchfork vinegar chillwave everyday 90's whatever.", "Pour-over artisan distillery street waistcoat.", "Salvia yr leggings franzen blue bottle."]
Faker::Hipster.sentences(number: 1) #=> ["Before they sold out pinterest venmo umami try-hard ugh hoodie artisan."]
Faker::Hipster.sentences(number: 1, supplemental: true) #=> ["Et sustainable optio aesthetic et."]

# Keyword arguments: sentence_count, supplemental, random_sentences_to_add
Faker::Hipster.paragraph #=> "Migas fingerstache pbr&b tofu. Polaroid distillery typewriter echo tofu actually. Slow-carb fanny pack pickled direct trade scenester mlkshk plaid. Banjo venmo chambray cold-pressed typewriter. Fap skateboard intelligentsia."
Faker::Hipster.paragraph(sentence_count: 2) #=> "Yolo tilde farm-to-table hashtag. Lomo kitsch disrupt forage +1."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: true) #=> "Typewriter iste ut viral kombucha voluptatem. Sint voluptates saepe. Direct trade irony chia excepturi yuccie. Biodiesel esse listicle et quam suscipit."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) #=> "Selvage vhs chartreuse narwhal vinegar. Authentic vinyl truffaut carry vhs pop-up. Hammock everyday iphone locavore thundercats bitters vegan goth. Fashion axe banh mi shoreditch whatever artisan."
Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) #=> "Deep v gluten-free unde waistcoat aperiam migas voluptas dolorum. Aut drinking illo sustainable sapiente. Direct trade fanny pack kale chips ennui semiotics."

# Keyword arguments: number, supplemental
Faker::Hipster.paragraphs #=> ["Tilde microdosing blog cliche meggings. Intelligentsia five dollar toast forage yuccie. Master kitsch knausgaard. Try-hard everyday trust fund mumblecore.", "Normcore viral pickled. Listicle humblebrag swag tote bag. Taxidermy street hammock neutra butcher cred kale chips. Blog portland humblebrag trust fund irony.", "Single-origin coffee fixie cleanse tofu xoxo. Post-ironic tote bag ramps gluten-free locavore mumblecore hammock. Umami loko twee. Ugh kitsch before they sold out."]
Faker::Hipster.paragraphs(number: 1) #=> ["Skateboard cronut synth +1 fashion axe. Pop-up polaroid skateboard asymmetrical. Ennui fingerstache shoreditch before they sold out. Tattooed pitchfork ramps. Photo booth yr messenger bag raw denim bespoke locavore lomo synth."]
Faker::Hipster.paragraphs(number: 1, supplemental: true) #=> ["Quae direct trade pbr&b quo taxidermy autem loko. Umami quas ratione migas cardigan sriracha minima. Tenetur perspiciatis pickled sed eum doloribus truffaut. Excepturi dreamcatcher meditation."]

# Keyword arguments: characters, supplemental
Faker::Hipster.paragraph_by_chars #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false) #=> "Hella kogi blog narwhal sartorial selfies mustache schlitz. Bespoke normcore kitsch cred hella fixie. Park aesthetic fixie migas twee. Cliche mustache brunch tumblr fixie godard. Drinking pop-up synth hoodie dreamcatcher typewriter. Kitsch biodiesel green."
```
