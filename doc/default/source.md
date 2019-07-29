# Faker::Source
Need to generate a code sample for something? Just give me the language (defaults to `ruby`, obviously).

```ruby
# Keyword argument: lang: :ruby
Faker::Source.hello_world #=> "print 'Hello World!'"
Faker::Source.hello_world(lang: :javascript) #=> "alert('Hello World!');"

# Keyword arguments: str: 'some string', lang: :ruby
Faker::Source.print #=> "print 'some string'"
Faker::Source.print(str: 'cake') #=> "print 'cake'"
Faker::Source.print(str: 'cake', lang: :javascript) #=> "console.log('cake');"

# Keyword argument: lang=:ruby
Faker::Source.print_1_to_10 <<-DOC=> "
  10.times do |i|
    print i
  end"
DOC
Faker::Source.print_1_to_10(lang: :javascript) <<-DOC=> "
  for (let i=0; i<10; i++) {
    console.log(i);
  }"
DOC
```
