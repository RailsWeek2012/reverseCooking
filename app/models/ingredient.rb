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

        @match_all = @recipes.select do |recipe|
          (recipe.ingredients - @search_values).empty?
        end

        @match_less = @recipes.select do |recipe|
          (recipe.ingredients - @search_values).length == 1
        end

        @match_some = @recipes.select do |recipe|
          (recipe.ingredients - @search_values).length == 2
        end



        if @match_all == nil && @match_less == nil && @match_some == nil
          return nil
        else
          return [@match_all.uniq, @match_less.uniq, @match_some.uniq]

        end

      end
    else
      return all
    end
  end

  attr_accessible :name, :category
  validates :name, :category, presence: true

end
