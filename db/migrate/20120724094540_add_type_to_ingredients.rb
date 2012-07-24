class AddTypeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :type, :string
  end
end
