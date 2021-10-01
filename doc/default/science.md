# Faker::Science

```ruby
##
# Produces a name of a science
# You can optionally filter by specifying one or more of the following:
# `:empirical, :formal, :natural, :social, :basic, :applied`
# @see https://en.wikipedia.org/wiki/Science#Branches_of_science
# @see Faker::Educator.subject
Faker::Science.science #=> "Space science"
Faker::Science.science(:natural, :applied) #=> "Engineering"
Faker::Science.science(:formal, :applied) #=> "Computer Science"

Faker::Science.element #=> "Carbon"

Faker::Science.element_symbol #=> "Pb"

Faker::Science.element_state #=> "Liquid"

Faker::Science.element_subcategory #=> "Reactive nonmetal"

Faker::Science.scientist #=> "Isaac Newton"

Faker::Science.scientist #=> "Isaac Newton"

Faker::Science.modifier #=> "Quantum"

##
# Produces the name of a scientific tool.
# Optionally it can generate tools with a science word modifier that sound more fancy.
#
# @param simple [Boolean] Whether to generate fancy non-realistic tool names, using the Q-word for example.
# @return [String]
Faker::Science.tool #=> "Superconductive Microcentrifuge"
Faker::Science.tool(simple: true) #=> "Microcentrifuge"
```
