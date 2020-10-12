# Faker::Finance

```ruby
# Random credit card
Faker::Finance.credit_card #=> "3018-348979-1853"
Faker::Finance.credit_card(:mastercard) #=> "6771-8921-2291-6236"
Faker::Finance.credit_card(:mastercard, :visa) #=> "4448-8934-1277-7195"

# Random vat number
# Keyword arguments: country
Faker::Finance.vat_number #=> "BR38.395.329/2471-83"
Faker::Finance.vat_number(country: 'DE') #=> "DE593306671"
Faker::Finance.vat_number(country: 'ZA') #=> "ZA79494416181"

# Random ticker
Faker::Finance.ticker #=> "AMZN"
## Supported: NASDAQ, NYSE
Faker::Finance.ticker('NASDAQ') #=> "GOOG"
```
