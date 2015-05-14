# require('spec_helper')
# require('recipe')
#
# describe(Recipe) do
#   describe('.list_recipes') do
#     it("returns an array of the recipes in a particular category") do
#       test_recipe = Recipe.new({:name => "Roast Cat", :instructions => "Skin and cook a cat on a spit"})
#       test_category = Category.new({:name => "cat"})
#       test_category.recipes.push(test_recipe)
#       expect(Recipe.list_recipes(test_category)).to(eq([test_recipe]))
#     end
#   end
# end
