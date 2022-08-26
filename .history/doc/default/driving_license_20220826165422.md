# Faker::DrivingLicense

```ruby
# Generate a license number in GB format, as issued in England, Scotland and Wales
# The DVSA does not publish their checksum algorithm, so the last 3 characters
# are random
# Keyword arguments: last_name, initials, date_of_birth, gender
Faker::DrivingLicense.british_driving_license        #=> "MCDER712081VF7EK"
Faker::DrivingLicense.british_driving_license(last_name: "O'Carroll",
                                              initials: "J",
                                              gender: :female,
                                              date_of_birth: Date.parse("1986-10-24")) #=> "OCARR815246J91HT"

# Generate a Northern Irish license number
Faker::DrivingLicense.northern_irish_driving_license #=> "70702548"

# Generate a UK driving license number in either GB or NI format, at a rate
# consistent with their relative populations
# Keyword arguments: last_name, initials, date_of_birth, gender
Faker::DrivingLicense.uk_driving_license             #=> "OCARR815246J91HT"
Faker::DrivingLicense.uk_driving_license             #=> "70702548"

# Generate a USA driving license number
# Default state for driving license is California
# Keyword arguments: state
Faker::DrivingLicense.usa_driving_license             #=> "E124590"
# USA driving license for Massachusetts state
Faker::DrivingLicense.usa_driving_license('new mexico')       #=> "85793820"
Faker::DrivingLicense.usa_driving_license('New Mexico')       #=> "57382918"
Faker::DrivingLicense.usa_driving_license('NEW MEXICO')       #=> "38593028"
