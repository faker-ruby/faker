# Faker::Lovecraft

```ruby
Faker::Lovecraft.fhtagn(3) #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn. Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn. Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"

Faker::Lovecraft.deity #=> "Shub-Niggurath"

Faker::Lovecraft.tome #=> "Book of Eibon"

Faker::Lovecraft.location #=> "Kingsport"

Faker::Lovecraft.word #=> "furtive"

# Optional arguments: word_count=4, random_words_to_add=6
Faker::Lovecraft.sentence #=> "Furtive antiquarian squamous dank cat loathsome amorphous lurk."
Faker::Lovecraft.sentence(3) #=> "Daemoniac antediluvian fainted squamous comprehension gambrel nameless singular."
Faker::Lovecraft.sentence(3, 1) #=> "Amorphous indescribable tenebrous."

# Optional arguments: num=3, spaces_allowed = false
Faker::Lovecraft.words #=> ["manuscript", "abnormal", "singular"]
Faker::Lovecraft.words(2) #=> ["daemoniac", "cat"]
Faker::Lovecraft.words(2, true) #=> ["lurk", "charnel"]

# Optional arguments: sentence_count=3
Faker::Lovecraft.sentences #=> ["Nameless loathsome decadent gambrel.", "Ululate swarthy immemorial cat madness gibbous unmentionable unnamable.", "Decadent antediluvian non-euclidean tentacles amorphous tenebrous."]
Faker::Lovecraft.sentences(2) #=> ["Antediluvian amorphous unmentionable singular accursed squamous immemorial.", "Gambrel daemoniac gibbous stygian shunned ululate iridescence abnormal."]

# Optional arguments: sentence_count=3, random_sentences_to_add=3
Faker::Lovecraft.paragraph #=> "Squamous nameless daemoniac fungus ululate. Cyclopean stygian decadent loathsome manuscript tenebrous. Foetid abnormal stench. Dank non-euclidean comprehension eldritch. Charnel singular shunned lurk effulgence fungus."
Faker::Lovecraft.paragraph(2) #=> "Decadent lurk tenebrous loathsome furtive spectral amorphous gibbous. Gambrel eldritch daemoniac cat madness comprehension stygian effulgence."
Faker::Lovecraft.paragraph(2, 1) #=> "Stench cyclopean fainted antiquarian nameless. Antiquarian ululate tenebrous non-euclidean effulgence."

# Optional arguments: paragraph_count=3
Faker::Lovecraft.paragraphs #=> ["Noisome daemoniac gibbous abnormal antediluvian. Unutterable fungus accursed stench noisome lurk madness indescribable. Antiquarian fungus gibbering lurk dank fainted. Hideous loathsome manuscript daemoniac lurk charnel foetid.", "Non-euclidean immemorial indescribable accursed furtive. Dank unnamable cyclopean tenebrous stench immemorial. Eldritch abnormal gibbering tenebrous. Singular accursed lurk.", "Charnel antediluvian unnamable cat blasphemous comprehension tenebrous. Nameless accursed amorphous unnamable stench. Squamous unnamable mortal accursed manuscript spectral gambrel amorphous. Shunned stygian charnel unutterable. Tenebrous ululate lurk amorphous unnamable."]
Faker::Lovecraft.paragraphs(2) #=> ["Hideous amorphous manuscript antediluvian non-euclidean cat eldritch foetid. Stench squamous manuscript amorphous gibbering fainted gibbous. Accursed loathsome blasphemous iridescence antediluvian abnormal ululate manuscript. Singular manuscript gibbering decadent accursed indescribable.", "Tenebrous unnamable comprehension antediluvian lurk. Lurk spectral noisome gibbering. Furtive manuscript madness tenebrous daemoniac."]
```
