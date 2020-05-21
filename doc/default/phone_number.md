# `Faker::PhoneNumber`

### Constants

Primary use of these constants is to pass them as parameters to `.phone_number(type = LOCAL)` or `.cell_phone(type = INTL)` so that numbers with country code and numbers without country code are generated.

  * LOCAL = 'local'
  * INTL = 'intl'

### `.phone_number(type = LOCAL)`

This formatter will return one of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 333.333.3333
  * 333-333-3333 x3333
  * (333) 333-3333 x3333
  * 333.333.3333 x3333

Note: For formats with extensions, the extension can be inclusively between 3 and 5 digits long.

### `.phone_number(type = INTL)`

This formatter will return one of the following formats:

  * +1-333-333-3333
  * +91-9999999999
  * +1 (333) 333-3333 x3333

Note: For formats with extensions, the extension can be inclusively between 3 and 5 digits long.

### `.cell_phone(type = LOCAL)`

This formatter will return one of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 1-333-333-3333
  * 333.333.3333

### `.cell_phone(type = INTL)`

This formatter will return one of the following formats:

  * +1-333-333-3333
  * +1 (333) 333-3333
  * +91-9999999999

### `.cell_phone_in_e164`

This formatter will return one of the following formats:

  * +33333333333333
  * +3333333333333

## Usage

Don't let the example output below fool you -- any format can be returned at random.

```ruby
Faker::PhoneNumber.phone_number #=> "397.693.1309 x4321"

Faker::PhoneNumber.cell_phone #=> "(186)285-7925"

Faker::PhoneNumber.cell_phone_in_e164 #=> "+944937040625"

# NOTE NOTE NOTE NOTE
# For the 'US only' methods below, first you must do the following:
Faker::Config.locale = 'en-US'
# or for Canada
Faker::Config.locale = 'en-CA'

# US only
Faker::PhoneNumber.area_code #=> "201"

# US only
Faker::PhoneNumber.exchange_code #=> "208"

# Keyword arguments: length
Faker::PhoneNumber.subscriber_number #=> "3873"
Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"

Faker::PhoneNumber.extension #=> "3764"

Faker::PhoneNumber.country_code #=> "+20"

Faker::PhoneNumber.phone_number_with_country_code #=> "+95 1-672-173-8153"

Faker::PhoneNumber.cell_phone_with_country_code #=> "+974 (190) 987-9034"
```
