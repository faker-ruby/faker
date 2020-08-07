# Faker::Barcode

Generates EAN, UPC, ISBN, ISMN, ISSN format barcode with check digit attached at last

```ruby
# EAN barcodes
Faker::Barcode.ean                                      => "85657526"
Faker::Barcode.ean(8)                                   => "30152700"
Faker::Barcode.ean(13)                                  => "2115190480285"

# EAN barcodes with composite string attached in code
Faker::Barcode.ean_with_composite_symbology             => "41007624|JHOC6649"
Faker::Barcode.ean_with_composite_symbology(8)          => "38357961|XUYJ3266"
Faker::Barcode.ean_with_composite_symbology(13)         => "9530722443911|CKHWQHID"

# UPC_A barcodes
Faker::Barcode.upc_a                                    => "766807541831"

# UPC_A barcode with composite symbology attached
Faker::Barcode.upc_a_with_composite_symbology           => "790670155765|JOVG6208"

# UPC_E barcode numbers
Faker::Barcode.upc_e                                    => "03746820"

# UPC_E barcode with composite symbology attached
Faker::Barcode.upc_e_with_composite_symbology           => "05149247|BKZX9722"

# ISBN barcode numbers
Faker::Barcode.isbn                                     => "9798363807732"

# ISMN barcode numbers
Faker::Barcode.ismn                                     => "9790527672897"

# ISSN barcode numbers
Faker::Barcode.issn                                     => "9775541703338"
```
