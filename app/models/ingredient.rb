class Ingredient < ActiveRecord::Base
  has_many :cook_items
  has_many :recipes, :through => :cook_items

  def self.search(search)
    if search
     all(:conditions => ['name LIKE ?', "%#{search}%"]).each do |ingredient|
       @recipes = Ingredient.recipe
       return @recipes
     end

    else
      return all
    end
  end

  attr_accessible :name
  validates :name, presence: true
end
