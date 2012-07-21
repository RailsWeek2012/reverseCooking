class Ingredient < ActiveRecord::Base
  has_many :cook_items
  has_many :recipes, :through => :cook_items

  attr_accessible :name
  validates :name, presence: true
end
