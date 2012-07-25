class Comment < ActiveRecord::Base

  belongs_to :recipe

  attr_accessible :name, :text, :created_at, :recipe_id
  validates :name, presence: true
  validates :text, presence: true

end
