class AddTypeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :category, :string
  end
end
