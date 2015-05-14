require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @recipes = Recipe.all.order(rating: :desc)
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


  # category_ids = []
  # categories_array.each do |category|
  #   category_id = category.id()
  #   category_ids.push(category_id)
  # end
  # found_categories =
  # category_ids.each do |id|

  if params[:category]
    index = 0
    new_categories = params.fetch("category")
    old_categories = @recipe.categories()

    old_categories.each() do |category|
      category.destroy()
    end

    new_categories.each do |category|
      new_category = Category.create({:name => category})

      new_category.recipes.push(@recipe)
      binding.pry

    end
  else
    @recipe.categories = @recipe.categories

  end


  if params[:ingredients]
    ingredients = params.fetch("ingredients")
  else
    ingredients = @recipe.ingredients()
  end
  if params.fetch("instructions") != ""
    instructions = params.fetch("instructions")
  else
    instructions = @recipe.instructions()
  end
  @recipe.update({:instructions => instructions })
  ingredients_array = ingredients.split("; ")
  ingredients_array.each do |ingredient|
    ingredient_new = Ingredient.create({:name => ingredient})
    ingredient_new.recipes.push(@recipe)

  end
  @recipes = Recipe.all()
  # ingredients_array = ingredients.split("; ")
  # ingredients_array.each do |ingredient|
  #   ingredient_new = Ingredient.create({ :name => ingredient})
  #   ingredient_new.recipes.push(new_recipe)

  redirect to("/recipe/#{@recipe.id}")
end

post('/') do
  @recipes = Recipe.all.order(rating: :desc)

  name = params.fetch("recipe")
  ingredients = params.fetch("ingredients")
  instructions = params.fetch("instructions")
  rating = params.fetch("rating")
  new_recipe = Recipe.create({:name => name, :instructions => instructions, :rating => rating})

  ingredients_array = ingredients.split("; ")
  ingredients_array.each do |ingredient|
    ingredient_new = Ingredient.create({ :name => ingredient})
    ingredient_new.recipes.push(new_recipe)
  end

  category_name = params.fetch("category")
  category_name.each() do |category|
    new_category = Category.create({:name => category})
    new_category.recipes.push(new_recipe)
  end

  erb(:index)
end

delete("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.delete()
  @recipes = Recipe.all()
  redirect to ('/')
end

get('/category/:id') do
  id = params.fetch("id").to_i()
  @category = Category.find(id)
  @recipes = @category.recipes()
  erb(:category)
end


get('/recipe/:id/edit') do
  id = params.fetch('id')
  @recipe = Recipe.find(id.to_i())
  erb(:edit_recipe)
end
