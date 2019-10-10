# Faker::DrivingLicence

```ruby
# Generate a licence number in GB format, as issued in England, Scotland and Wales
# The DVSA does not publish their checksum algorithm, so the last 3 characters
# are random
# Keyword arguments: last_name, initials, date_of_birth, gender
Faker::DrivingLicence.british_driving_licence        #=> "MCDER712081VF7EK"
Faker::DrivingLicence.british_driving_licence(last_name: "O'Carroll",
                                              initials: "J",
                                              gender: :female,
                                              date_of_birth: Date.parse("1986-10-24")) #=> "OCARR815246J91HT"

# Generate a Northern Irish licence number
Faker::DrivingLicence.northern_irish_driving_licence #=> "70702548"

# Generate a UK driving licence number in either GB or NI format, at a rate
# consistent with their relative populations
# Keyword arguments: last_name, initials, date_of_birth, gender
Faker::DrivingLicence.uk_driving_licence             #=> "OCARR815246J91HT"
Faker::DrivingLicence.uk_driving_licence             #=> "70702548"
