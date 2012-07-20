class CookItem < ActiveRecord::Base
    belongs_to :ingredient
    belongs_to :recipe
  attr_accessible :ingredient_id, :quantity, :recipe_id, :unit
end
