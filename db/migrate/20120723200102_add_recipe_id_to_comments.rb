class AddRecipeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :recipe_id, :int
  end
end
