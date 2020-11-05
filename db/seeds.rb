puts "clearing ingredients..."
Ingredient.destroy_all
puts "cleared ingredients..."
puts "generating ingredients..."

list = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
parsed = JSON.parse(list)
parsed['drinks'].each do |thing|
  name = thing['strIngredient1']
  Ingredient.create!(name: name)
end
puts "generated #{Ingredient.count} ingredients"
