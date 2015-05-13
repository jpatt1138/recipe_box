require('spec_helper')

describe(Ingredient) do

  describe("#split_up") do
    it("takes the ingredient string and splits it into an array") do
      test_ingredient_string = "fish; eggs; 1 manky boot"
      test_ingredient_string.split_up()
      expect(Ingredients.all).to(eq(["fish", "eggs", "1 manky boot"]))
    end
  end
end
