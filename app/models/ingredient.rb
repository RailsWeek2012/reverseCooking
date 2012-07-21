class Ingredient < ActiveRecord::Base
  has_many :cook_items
  has_many :recipes, :through => :cook_items

  def self.search(search)
    if search
      @recipes = Array(nil)
     all(:conditions => ['name LIKE ?', "%#{search}%"]).each do |ingredient|

       ingredient.cook_items.each do |item|
         @recipes.append Recipe.find(item.recipe_id)
       end

       return @recipes
     end

    else
      return all
    end
  end

  attr_accessible :name
  validates :name, presence: true
end
