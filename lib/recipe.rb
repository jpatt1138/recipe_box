class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories

  scope :list_recipes, lambda { |category| where(:id => recipe.category.id())}

end
