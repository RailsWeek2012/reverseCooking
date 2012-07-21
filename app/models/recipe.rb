class Recipe < ActiveRecord::Base
  has_many :cook_items
  has_many :ingredients, :through => :cook_items


  attr_accessible :formula, :name
  validates :formula, :name, presence: true
  accepts_nested_attributes_for   :ingredients,  :cook_items

end
