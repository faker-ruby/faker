# Faker::Source
Need to generate a code sample for something? Just give me the language (defaults to `ruby`, obviously).

It might be available in the next version.

```ruby
# Optional argument: lang=:ruby
Faker::Source.hello_world #=> "print 'Hello World!'"
Faker::Source.hello_world(:javascript) #=> "alert('Hello World!');"

# Optional arguments: str='some string', lang=:ruby
Faker::Source.print #=> "print 'some string'"
Faker::Source.print('cake') #=> "print 'cake'"
Faker::Source.print(str: 'cake', lang: :javascript) #=> "console.log('cake');"

# Optional argument: lang=:ruby
Faker::Source.print_1_to_10 <<-DOC=> "
  10.times do |i|
    print i
  end"
DOC
Faker::Source.print_1_to_10(:javascript) <<-DOC=> "
  for (let i=0; i<10; i++) {
    console.log(i);
  }"
DOC
```
