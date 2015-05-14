class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes

  # def recipes_from_category
  #   return Recipe.where(:category => self.id())
  # 
  # end
end
