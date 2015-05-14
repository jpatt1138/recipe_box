class RenameCategoriesIdSingularForActiverecordRecognition < ActiveRecord::Migration
  def change

    #rename 'categories_id' in join table to singular 'category_id' for better activerecord recognition (as per ingredients_recipes join table)

    change_table :categories_recipes do |t|
      t.rename :categories_id, :category_id
      t.rename :recipes_id, :recipe_id
    end    
  end
end
