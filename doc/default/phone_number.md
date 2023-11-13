# Faker::PhoneNumber

Phone numbers generate North American Numbering Plan formats (with +1 as the country code). For different countries formats, see [Phone Numbers and Locales](#phone-number-and-locales).

## Faker::PhoneNumber.phone_number

Generates a phone number in a random format without the country code and it can have different dividers.

```ruby
Faker::PhoneNumber.phone_number #=> "(504) 113-1705"
Faker::PhoneNumber.phone_number #=> "662.291.7201"
Faker::PhoneNumber.phone_number #=> "9415283713"
```

## Faker::PhoneNumber.cell_phone

Generates a random cell phone number in a random format without the country code and it can have different dividers.

```ruby
Faker::PhoneNumber.cell_phone #=> "(836) 115-8995"
Faker::PhoneNumber.cell_phone #=> "382-597-5739"
Faker::PhoneNumber.cell_phone #=> "316.828.1822"
```

## Faker::PhoneNumber.country_code

Generates a random country code number.

```ruby
Faker::PhoneNumber.country_code #=> "+20"
Faker::PhoneNumber.country_code #=> "+39"
Faker::PhoneNumber.country_code #=> "+852"
```

## Faker::PhoneNumber.phone_number_with_country_code

Generates a random phone number with country code.

```ruby
Faker::PhoneNumber.phone_number_with_country_code #=> "+55 466-746-6882"
Faker::PhoneNumber.phone_number_with_country_code #=> "+81 3718219558"
Faker::PhoneNumber.phone_number_with_country_code #=> "+49 140 957 9846"
```

## Faker::PhoneNumber.cell_phone_with_country_code

Generates a random cell phone number with country code.

```ruby
Faker::PhoneNumber.cell_phone_with_country_code #=> "+852 (190) 987-9034"
Faker::PhoneNumber.cell_phone_with_country_code #=> "+64 (820) 583-6474"
Faker::PhoneNumber.cell_phone_with_country_code #=> "+1 591.871.7985"
```

## Faker::PhoneNumber.cell_phone_in_e164

Generates a random phone number in e164 format, i.e., without any dividers.

```ruby
Faker::PhoneNumber.cell_phone_in_e164 #=> "+542024834991"
Faker::PhoneNumber.cell_phone_in_e164 #=> "+8522846847703"
Faker::PhoneNumber.cell_phone_in_e164 #=> "+649477546575"
```

## Faker::PhoneNumber.area_code

Generates a random area code.

```ruby
Faker::PhoneNumber.area_code #=> "201"
Faker::PhoneNumber.area_code #=> "613"
Faker::PhoneNumber.area_code #=> "321"
```

## Faker::PhoneNumber.exchange_code

Generates a random exchange code.

```ruby
Faker::PhoneNumber.exchange_code #=> "208"
Faker::PhoneNumber.exchange_code #=> "415"
Faker::PhoneNumber.exchange_code #=> "652"
```

## Faker::PhoneNumber.subscriber_number (alias Faker::PhoneNumber.extension)

Generates a random extension / subscriber number. Can be used for both extensions and last four digits of phone number.

```ruby
# keyword arguments: length. Defaults to 4.
Faker::PhoneNumber.subscriber_number #=> "3873"
Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"
Faker::PhoneNumber.extension #=> "3764"
Faker::PhoneNumber.extension(length: 2) => "37"
```

## Phone Number and Locales

If no locale is set, Faker generates North American Numbering Plan formats (with +1 area code). For more accurate values when generating US or CA formats, it's
recommended to set their locales accordingly:

```ruby
# set locale first
Faker::Config.locale = 'en-US'
Faker::PhoneNumber.country_code #=> "+1"
Faker::PhoneNumber.area_code #=> "504"
Faker::PhoneNumber.exchange_code #=> "715"


# set locale first
Faker::Config.locale = 'en-CA'
Faker::PhoneNumber.country_code #=> "+1"
Faker::PhoneNumber.area_code #=> "226"
Faker::PhoneNumber.exchange_code #=> "956"
```

Besides US and CA formats, Faker also generates phone numbers according to various locales. Here are some examples:

```ruby
Faker::Config.locale = 'da-DK'
Faker::PhoneNumber.cell_phone_with_country_code # => "+45 20 76 45 76"

Faker::Config.locale = 'de'
Faker::PhoneNumber.cell_phone_with_country_code # => "+49 1559-7973422"

Faker::Config.locale = 'pt-BR'
Faker::PhoneNumber.cell_phone_with_country_code # => "+55 (77) 96227-7968"
```
