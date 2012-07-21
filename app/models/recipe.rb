class Recipe < ActiveRecord::Base
  has_many :cook_items
  has_many :ingredients, :through => :cook_items

  def self.search(search)
    if search
      all(:conditions => ['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  attr_accessible :formula, :name
  validates :formula, :name, presence: true
  accepts_nested_attributes_for   :ingredients,  :cook_items

end
