require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/:id') do
  @id = params.fetch("id")
  @recipe = Recipe.find(@id)
  erb(:recipe)
end

patch('/recipe/:id') do
  id = params.fetch("id")
  @recipe = Recipe.find(params.fetch("id").to_i())
  if params.fetch("category") != ""
    category = params.fetch("category")
  else
    category = @recipe.category()
  end
  if params.fetch("ingredients") != ""
    ingredients = params.fetch("ingredients")
  else
    ingredients = @recipe.ingredients()
  end
  if params.fetch("instructions") != ""
    instructions = params.fetch("instructions")
  else
    instructions = @recipe.instructions()
  end
  @recipe.update({:category => category, :ingredients => ingredients, :instructions => instructions })
  @recipes = Recipe.all()
  # erb(:recipe)
  redirect to("/recipe/#{@recipe.id()}")
end

post('/') do
  @recipes = Recipe.all()
  name = params.fetch("recipe")
  category = params.fetch("category")
  ingredients = params.fetch("ingredients")
  instructions = params.fetch("instructions")
  new_recipe = Recipe.create({:name => name, :instructions => instructions, :category => category})
  ingredients_array = ingredients.split("; ")
  ingredients_array.each do |ingredient|
  ingredient_new = Ingredient.create({ :name => ingredient})
  ingredient_new.recipes.push(new_recipe)
  end
  erb(:index)
end

get('/recipe/:id/edit') do
  id = params.fetch('id')
  @recipe = Recipe.find(id.to_i())
  erb(:edit_recipe)
end
