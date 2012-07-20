class Recipe < ActiveRecord::Base
  has_many :cook_items
  has_many :ingredients, :through => :cook_items


  attr_accessible :formula, :name
end
