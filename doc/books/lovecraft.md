# Faker::Books::Lovecraft

```ruby
Faker::Books::Lovecraft.fhtagn #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"
Faker::Books::Lovecraft.fhtagn(number: 3) #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn. Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn. Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"

Faker::Books::Lovecraft.deity #=> "Shub-Niggurath"

Faker::Books::Lovecraft.tome #=> "Book of Eibon"

Faker::Books::Lovecraft.location #=> "Kingsport"

Faker::Books::Lovecraft.word #=> "furtive"

# Optional arguments: word_count=4, random_words_to_add=6
Faker::Books::Lovecraft.sentence #=> "Furtive antiquarian squamous dank cat loathsome amorphous lurk."
Faker::Books::Lovecraft.sentence(word_count: 3) #=> "Daemoniac antediluvian fainted squamous comprehension gambrel nameless singular."
Faker::Books::Lovecraft.sentence(word_count: 3, random_words_to_add: 1) #=> "Amorphous indescribable tenebrous."

# Optional arguments: num=3, spaces_allowed = false
Faker::Books::Lovecraft.words #=> ["manuscript", "abnormal", "singular"]
Faker::Books::Lovecraft.words(number: 2) #=> ["daemoniac", "cat"]
Faker::Books::Lovecraft.words(number: 2, spaces_allowed: true) #=> ["lurk", "charnel"]

# Optional arguments: sentence_count=3
Faker::Books::Lovecraft.sentences #=> ["Nameless loathsome decadent gambrel.", "Ululate swarthy immemorial cat madness gibbous unmentionable unnamable.", "Decadent antediluvian non-euclidean tentacles amorphous tenebrous."]
Faker::Books::Lovecraft.sentences(number: 2) #=> ["Antediluvian amorphous unmentionable singular accursed squamous immemorial.", "Gambrel daemoniac gibbous stygian shunned ululate iridescence abnormal."]

# Optional arguments: sentence_count=3, random_sentences_to_add=3
Faker::Books::Lovecraft.paragraph #=> "Squamous nameless daemoniac fungus ululate. Cyclopean stygian decadent loathsome manuscript tenebrous. Foetid abnormal stench. Dank non-euclidean comprehension eldritch. Charnel singular shunned lurk effulgence fungus."
Faker::Books::Lovecraft.paragraph(sentence_count: 2) #=> "Decadent lurk tenebrous loathsome furtive spectral amorphous gibbous. Gambrel eldritch daemoniac cat madness comprehension stygian effulgence."
Faker::Books::Lovecraft.paragraph(sentence_count: 2, random_sentences_to_add: 1) #=> "Stench cyclopean fainted antiquarian nameless. Antiquarian ululate tenebrous non-euclidean effulgence."

# Optional arguments: paragraph_count=3
Faker::Books::Lovecraft.paragraphs #=> ["Noisome daemoniac gibbous abnormal antediluvian. Unutterable fungus accursed stench noisome lurk madness indescribable. Antiquarian fungus gibbering lurk dank fainted. Hideous loathsome manuscript daemoniac lurk charnel foetid.", "Non-euclidean immemorial indescribable accursed furtive. Dank unnamable cyclopean tenebrous stench immemorial. Eldritch abnormal gibbering tenebrous. Singular accursed lurk.", "Charnel antediluvian unnamable cat blasphemous comprehension tenebrous. Nameless accursed amorphous unnamable stench. Squamous unnamable mortal accursed manuscript spectral gambrel amorphous. Shunned stygian charnel unutterable. Tenebrous ululate lurk amorphous unnamable."]
Faker::Books::Lovecraft.paragraphs(number: 2) #=> ["Hideous amorphous manuscript antediluvian non-euclidean cat eldritch foetid. Stench squamous manuscript amorphous gibbering fainted gibbous. Accursed loathsome blasphemous iridescence antediluvian abnormal ululate manuscript. Singular manuscript gibbering decadent accursed indescribable.", "Tenebrous unnamable comprehension antediluvian lurk. Lurk spectral noisome gibbering. Furtive manuscript madness tenebrous daemoniac."]

# Optional arguments: chars=3, supplemental=false
Faker::Books::Lovecraft.paragraph_by_chars #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
Faker::Books::Lovecraft.paragraph_by_chars(characters: 256) #=> "Hella kogi blog narwhal sartorial selfies mustache schlitz. Bespoke normcore kitsch cred hella fixie. Park aesthetic fixie migas twee. Cliche mustache brunch tumblr fixie godard. Drinking pop-up synth hoodie dreamcatcher typewriter. Kitsch biodiesel green."
```
