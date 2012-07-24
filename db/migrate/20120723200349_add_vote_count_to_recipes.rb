class AddVoteCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :vote_count, :int
  end
end
