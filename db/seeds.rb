require 'json'
require 'open-uri'

if Rails.env.development?
  puts "Emptying glasses..."
  Ingredient.destroy_all
  Cocktail.destroy_all
end

puts "Adding drinks..."

Cocktail.create(name: "Red-Headed Susan")
Cocktail.create(name: "The PoPo")
Cocktail.create(name: "El Magic Pepe")

result = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

puts "Adding ingredients..."
puts "Adding: "

drinks.each do |hash|
  hash.each do |key, val|
    Ingredient.create(name: val)
    print "♪┏(・o・)┛♪ #{val}, "
  end
end

puts
puts "Drinks are ready!"
