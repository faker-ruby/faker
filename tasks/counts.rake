require 'yaml'
require 'json'
config = YAML.load_file('lib/locales/en.yml')

def address(config)
  address = config["en"]["faker"]["address"]

  address.each do |key, value|
    value = value.split if value.is_a? String
    puts "#{key} has #{value.length} elements"
  end
end

def ancient(config)
  ancient = config["en"]["faker"]["ancient"]

  ancient.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def app(config)
  ancient = config["en"]["faker"]["app"]

  ancient.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def bank(config)
  bank = config["en"]["faker"]["bank"]

  bank.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def beer(config)
  beer = config["en"]["faker"]["beer"]

  beer.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def book(config)
  book = config["en"]["faker"]["book"]

  book.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def business(config)
  business = config["en"]["faker"]["business"]

  business.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def cat(config)
  cat = config["en"]["faker"]["cat"]

  cat.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def chuck_norris(config)
  chuck_norris = config["en"]["faker"]["chuck_norris"]

  chuck_norris.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def code(config)
  code = config["en"]["faker"]["code"]

  code.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end


def credit_card(config)
  credit_card = config["en"]["faker"]["credit_card"]

  credit_card.each do |key, value|
    value = value.split if value.is_a? String
    puts "#{key} has #{value.length} elements"
  end
end

def company(config)
  company = config["en"]["faker"]["company"]

  company.each do |key, value|
    value = value.split if value.is_a? String
    if key == "buzzwords" || key == "bs"
      value = value.flatten
    end
    puts "#{key} has #{value.length} elements"
  end
end

def demographic(config)
  demographic = config["en"]["faker"]["demographic"]

  demographic.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def dessert(config)
  dessert = config["en"]["faker"]["dessert"]

  dessert.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def dragon_ball(config)
  dragon_ball = config["en"]["faker"]["dragon_ball"]

  dragon_ball.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def files(config)
  file = config["en"]["faker"]["file"]

  file.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

def food(config)
  food = config["en"]["faker"]["food"]

  food.each do |key, value|
    puts "#{key} has #{value.length} elements"
  end
end

# skipping compass
# def compass(config)
#   compass = config["en"]["faker"]["compass"]
#
#   compass.each do |key, value|
#   end
# end


# address(config)
# ancient(config)
# app(config)
#no avatar in url
# bank(config)
# beer(config)
#no bitcoin in yml
# book(config)
# not doing boolean
# business(config)
# cat(config)
# chuck_norris(config)
# code(config)
# not doing coffee
# not doing color
# not doing commerce
# company(config)
# crypto not in yml
# credit_card(config)
# skip compass(config)
# demographic(config)
# dessert(config)
# dragon_ball(config)
# not doing educator
# files(config)
food(config)
