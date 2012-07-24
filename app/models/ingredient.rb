class Ingredient < ActiveRecord::Base
  has_many :cook_items
  has_many :recipes, :through => :cook_items

  def self.search(search)
    if search

      @recipes = Array nil
      @search_values = Array nil

      if search.blank?
        return @recipes

      else

        search.split(' ').each do |aParam|
          ingredients = all(:conditions => ['name LIKE ?', "%#{aParam}%"])

          ingredients.each do |i|
            @search_values.append i
            @recipes += i.recipes
          end
        end

        @match = @recipes.select do |recipe|
          (recipe.ingredients - @search_values).empty?
        end

        @match_less = @recipes.select do |rec|
          (rec.ingredients - @search_values).length == 1
        end

        return [@match.uniq, @match_less.uniq]

      end
    else
      return all
    end
  end

  attr_accessible :name, :type
  validates :name, presence: true

end
