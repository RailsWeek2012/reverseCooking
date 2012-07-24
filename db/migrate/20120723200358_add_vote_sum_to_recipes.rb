class AddVoteSumToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :vote_sum, :int
  end
end
