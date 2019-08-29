# Faker::Lorem

```ruby
Faker::Lorem.word #=> "repellendus"

# Keyword arguments: number, supplemental (words from a supplementary list of Lorem-like words)
Faker::Lorem.words #=> ["dolores", "adipisci", "nesciunt"]
Faker::Lorem.words(number: 4) #=> ["culpa", "recusandae", "aut", "omnis"]
Faker::Lorem.words(number: 4, supplemental: true) #=> ["colloco", "qui", "vergo", "deporto"]

Faker::Lorem.multibyte #=> 😀

# Keyword arguments: number, min_alpha, min_numeric
Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
Faker::Lorem.characters(number: 10) #=> "ang9cbhoa8"
Faker::Lorem.characters(number: 10, min_alpha: 4) #=> "ang9cbhoa8"
Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) #=> "ang9cbhoa8"

# Keyword arguments: word_count, supplemental, random_words_to_add
# The 'random_words_to_add' argument increases the sentence's word count by a random value within (0..random_words_to_add).
# To specify an exact word count for a sentence, set word_count to the number you want and random_words_to_add equal to 0.
# By default, sentences will not have any random words added (and will all be exactly 4 words long)
Faker::Lorem.sentence #=> "Quia illum libero magni."
Faker::Lorem.sentence(word_count: 3) #=> "Quaerat quam unde."
Faker::Lorem.sentence(word_count: 3, supplemental: true) #=> "Vehemens velit cogo."
Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) #=> "Aut voluptatem illum fugit ut sit."
Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4) #=> "Accusantium tantillus dolorem timor."

# Keyword arguments: number, supplemental
Faker::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
Faker::Lorem.sentences(number: 1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
Faker::Lorem.sentences(number: 1, supplemental: true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]

# Keyword arguments: sentence_count, supplemental, random_sentences_to_add
# The 'random_sentences_to_add' argument increases the paragraph's sentence count by a random value within (0..random_sentences_to_add).
# To specify an exact sentence count for a paragraph, set sentence_count to the number you want and random_sentences_to_add equal to 0.
# By default, sentences will have a random number of words within the range (3..6).
Faker::Lorem.paragraph #=> "Recusandae minima consequatur. Expedita sequi blanditiis. Ut fuga et."
Faker::Lorem.paragraph(sentence_count: 2) #=> "Ducimus mollitia deserunt. Dicta et corporis."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: true) #=> "Strues amplitudo dignissimos. Ver trucido charisma."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) #=> "Neque aut et nemo aut incidunt voluptates. Dolore cum est sint est. Vitae assumenda porro odio dolores fugiat. Est voluptatum quia rerum."
Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) #=> "Vomito unde uxor annus. Et patior utilis sursum."

# Keyword arguments: number, supplemental
Faker::Lorem.paragraphs #=> ["Dolores quis quia ad quo voluptates. Maxime delectus totam numquam. Necessitatibus vel atque qui dolore.", "Id neque nemo. Dolores iusto facere est ad. Accusamus ipsa dolor ut.", "Et officiis ut hic. Sunt asperiores minus distinctio debitis ipsa dolor. Minima eos deleniti."]
Faker::Lorem.paragraphs(number: 1) #=> ["Labore voluptas sequi. Ratione nulla eaque quia molestiae fugit. At quam laboriosam aut ut dignissimos."]
Faker::Lorem.paragraphs(number: 1, supplemental: true) #=> ["Depulso animi cunctatio amicitia adficio. Vester viduo qui despirmatio voluptas. Validus laudantium adopto ut agnitio venustas. Aer arcus odio esse."]

# Keyword arguments: word_count, supplemental, random_words_to_add
Faker::Lorem.question #=> "Vero eum dolore qui?"
Faker::Lorem.question(word_count: 4) #=> "Eos temporibus necessitatibus labore?"
Faker::Lorem.question(word_count: 4, supplemental: false) #=> "Eum ut repellendus neque?"
Faker::Lorem.question(word_count: 4, supplemental: false, random_words_to_add: 0) #=> "Expedita quia labore voluptatem?"

# Keyword arguments: number, supplemental
Faker::Lorem.questions(number: 3) #=> ["Ratione eaque doloremque?", "Qui aliquid fuga?", "Est cum ipsum?"]
Faker::Lorem.questions(number: 3, supplemental: false) #=> ["Iusto ipsa magnam?", "Quibusdam eaque amet?", "Officia delectus laboriosam?"]

# Keyword arguments: number, supplemental
Faker::Lorem.paragraph_by_chars #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) #=> "Hella kogi blog narwhal sartorial selfies mustache schlitz. Bespoke normcore kitsch cred hella fixie. Park aesthetic fixie migas twee. Cliche mustache brunch tumblr fixie godard. Drinking pop-up synth hoodie dreamcatcher typewriter. Kitsch biodiesel green."
```
