# Faker::Vehicle

```ruby
# Generate vehicle identification number
Faker::Vehicle.vin #=> "LLDWXZLG77VK2LUUF"

# Random vehicle manufacturer
Faker::Vehicle.manufacture #=> "Brilliance"
Faker::Vehicle.make #=> "Citroën"

# Random vehicle color
Faker::Vehicle.color #=> "Red"

# Random vehicle transmission
Faker::Vehicle.transmission #=> "Automanual"

# Random vehicle drive type
Faker::Vehicle.drive_type #=> "4x2/2-wheel drive"

# Random vehicle fuel type
Faker::Vehicle.fuel_type #=> "Diesel"

# Random vehicle style
Faker::Vehicle.style #=> "ESi"

# Random car type
Faker::Vehicle.car_type #=> "Sedan"

# Random car options
Faker::Vehicle.car_options #=> ["DVD System", "MP3 (Single Disc)", "Tow Package", "CD (Multi Disc)", "Cassette Player", "Bucket Seats", "Cassette Player", "Leather Interior", "AM/FM Stereo", "Third Row Seats"]
Faker::Vehicle.car_options(7) #=> ["MP3 (Single Disc)", "A/C: Front", "Antilock Brakes", "Tinted Glass", "Integrated Phone", "Cassette Player", "Third Row Seats"]
Faker::Vehicle.car_options(8, 25) #=> ["Power Locks", "Bucket Seats", "A/C: Rear", "Power Locks", "Tinted Glass", "Alloy Wheels", "Tinted Glass", "Tow Package", "Power Windows", "Antilock Brakes", "Leather Interior", "Power Steering", "A/C: Front", "DVD System", "Power Windows", "DVD System", "Rear Window Defroster", "Integrated Phone", "MP3 (Single Disc)", "Rear Window Wiper", "MP3 (Single Disc)", "Premium Sound", "Airbag: Driver", "CD (Multi Disc)"]

# Random standard car specs
Faker::Vehicle.standard_specs #=> ["Full-size spare tire w/aluminum alloy wheel", "Back-up camera", "Carpeted cargo area", "Silver accent IP trim finisher -inc: silver shifter finisher", "Back-up camera", "Water-repellent windshield & front door glass", "Floor carpeting"]
Faker::Vehicle.standard_specs(1) #=> ["Rear-window defogger w/auto-off timer"]
Faker::Vehicle.standard_specs(2, 3) #=> ["Black roof molding", "200mm front axle"]

# Random number of doors
Faker::Vehicle.doors #=> 1
Faker::Vehicle.door_count #=> 3

# Random engine size
Faker::Vehicle.engine_size #=> 6
Faker::Vehicke.engine #=> 4

# Random car year
# Between 1 and 15 years ago
Faker::Vehicle.year #=> 2008

# Random mileage/kilometrage
Faker::Vehicle.mileage #=> 26961
Faker::Vehicle.mileage(50_000) #=> 81557
Faker::Vehicle.mileage(50_000, 250_000) #=> 117503
Faker::Vehicle.kilometrage #=> 35378

# Random vehicle license plate
Faker::Vehicle.license_plate #=> "DEP-2483"
Faker::Vehicle.license_plate('FL') #=> "977 UNU"
```
