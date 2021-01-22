require 'json'
require 'open-uri'

if Rails.env.development?
  puts "Emptying glasses..."
  Ingredient.destroy_all
  Cocktail.destroy_all
end

puts "Adding drinks..."

file = URI.open('https://prods3.imgix.net/images/articles/2018_06/nonfeatured-far-east-side-cocktail.jpg?auto=format%2Ccompress&ixjsv=2.2.3&w=750')
cocktail = Cocktail.create!(name: 'Midori Mojito')
cocktail.photo.attach(io: file, filename: 'cocktail.png', content_type: 'image/png')

file2 = URI.open('https://www.homemadefoodjunkie.com/wp-content/uploads/2020/01/Bacardi-Cocktail-on-table-735x734.jpg')
cocktail = Cocktail.create!(name: 'Cherry Medjool')
cocktail.photo.attach(io: file2, filename: 'cocktail2.png', content_type: 'image/png')

file2 = URI.open('https://www.liquor.com/thmb/bROByI035goEOvUA79GIu9VL1Vk=/720x540/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__liquor__2012__02__06130257__clover-club-720x720-article-6939c632414a4f2a9c15ced66eac4e26.jpg')
cocktail = Cocktail.create!(name: 'Ichigo Delight')
cocktail.photo.attach(io: file2, filename: 'cocktail3.png', content_type: 'image/png')

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
