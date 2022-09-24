# `Faker::PhoneNumber`

### `.phone_number`

This formatter will return one of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 1-333-333-3333
  * 333.333.3333
  * 333-333-3333 x3333
  * (333) 333-3333 x3333
  * 1-333-333-3333 x3333
  * 333.333.3333 x3333

Note: For formats with extensions, the extension can be inclusively between 3 and 5 digits long.

### `.cell_phone`

This formatter will return one of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 1-333-333-3333
  * 333.333.3333

### `.cell_phone_in_e164`

This formatter will return one of the following formats:

  * +33333333333333
  * +3333333333333

## Locale
By setting the locale, you can generate a phone number with a valid area code in that locale (and valid exchange code, where relevant).

### Locales with area codes
```Faker::Config.locale = 'en-US'
Faker::Config.locale = 'en-CA'
Faker::Config.locale = 'fr-CA'
Faker::Config.locale = 'en-AU'
Faker::Config.locale = 'pt-BR'
```

### Locales with exchange codes
```Faker::Config.locale = 'en-US'
Faker::Config.locale = 'en-CA'
Faker::Config.locale = 'fr-CA'
```

## Usage

Don't let the example output below fool you -- any format can be returned at random.

```ruby
Faker::PhoneNumber.phone_number #=> "397.693.1309 x4321"

Faker::PhoneNumber.cell_phone #=> "(186)285-7925"

Faker::PhoneNumber.cell_phone_in_e164 #=> "+944937040625"

# NOTE NOTE NOTE NOTE
# For these two 'Locale-specific' methods, first you must set a relevant locale as mentioned above, such as:
Faker::Config.locale = 'en-US'
# or for Canada
Faker::Config.locale = 'en-CA'

# Locale-specific
Faker::PhoneNumber.area_code #=> "201"

# Locale-specific
Faker::PhoneNumber.exchange_code #=> "208"

# Keyword arguments: length
Faker::PhoneNumber.subscriber_number #=> "3873"
Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"

Faker::PhoneNumber.extension #=> "3764"

Faker::PhoneNumber.country_code #=> "+20"

Faker::PhoneNumber.phone_number_with_country_code #=> "+95 1-672-173-8153"

Faker::PhoneNumber.cell_phone_with_country_code #=> "+974 (190) 987-9034"
```
