# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
require 'json'
require 'net/http'

# URL to json ingredients
url = URI('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
api_call = Net::HTTP.get(url)
ingredients = JSON.parse(api_call)['drinks']
ingredients.each do |ingredient|
  ing = ingredient['strIngredient1']
  Ingredient.create!(name: ing)
end
