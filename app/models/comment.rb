class Comment < ActiveRecord::Base

  belongs_to :recipes

  attr_accessible :name, :text, :created_at
  validates :name, presence: true
  validates :text, presence: true

end
