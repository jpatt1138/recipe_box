require("spec_helper")
require('rspec')
require('category')

describe (Category) do
  describe ('#recipes_from_category') do
    it("returns recipes from a specific category") do
      test_recipe = Recipe.new({:name => "Roast Cat", :instructions => "Skin and cook a cat on a spit"})
      test_category = Category.new({:name => "cat"})
      test_category.recipes.push(test_recipe)
      expect(test_category.recipes_from_category).to(eq([test_recipe]))
    end
end
end
