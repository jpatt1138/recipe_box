class AddTables < ActiveRecord::Migration
  def change

    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.timestamps()
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :text)
      t.column(:category, :string)
      t.column(:rating, :integer)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end

  end
end
