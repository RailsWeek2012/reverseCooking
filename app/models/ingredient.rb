class Ingredient < ActiveRecord::Base
  has_many :cook_items
  has_many :recipes, :through => :cook_items

  def self.search(search)
    if search
      @recipes = Array(nil)
      if search.blank?
         return @recipes

      else
        search.split(' ').each do |aParam|
          all(:conditions => ['name LIKE ?', "%#{aParam}%"]).each do |result|

           result.cook_items.each do |item|
             @recipes.append Recipe.find(item.recipe_id)
           end


          @recipes.each do |recipe|
            search.split(' ').each do |ingredient_search|
             @recipes.delete recipe unless recipe.ingredients.include? ingredient_search
            end
          end


             return @recipes

          end
         end
        end
    else
      return all
    end
  end

  attr_accessible :name
  validates :name, presence: true

end
