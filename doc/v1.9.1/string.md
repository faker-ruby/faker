# Faker::String
Random UTF-8 string with optional nested length selectors.  Very useful for testing.  Guaranteed to find bugs in your code.  Want robust code?  Test with these.  Includes every UTF-8 codepoint.

```ruby
Faker::String.random #=> "3 뇦\u0017&y\u{3A109}$8^4* 녹豿4좘툢ꔾ쉙6ɉ\uA6 8TN畀챵|\"3쇤Ŵ"
Faker::String.random(4) #=> "⼨%0*"
Faker::String.random(3..12) #=> "\u{69FDC};秨툫"
Faker::String.random([0, 6]) #=> "I轤𣴒P溟L"
Faker::String.random([1, (2..5), [3, 6], nil]) #=> "葓L#ћ"
```
