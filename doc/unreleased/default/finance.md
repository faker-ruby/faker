# Faker::Finance

```ruby
# Random credit_card
Faker::Finance.credit_card #=> "3018-348979-1853"
Faker::Finance.credit_card(:mastercard) #=> "6771-8921-2291-6236"
Faker::Finance.credit_card(:mastercard, :visa) #=> "4448-8934-1277-7195"

# Random vat_number
Faker::Finance.vat_number #=> "BR38.395.329/2471-83"
Faker::Finance.vat_number('DE') #=> "DE593306671"
Faker::Finance.vat_number('ZA') #=> "ZA79494416181"
```
