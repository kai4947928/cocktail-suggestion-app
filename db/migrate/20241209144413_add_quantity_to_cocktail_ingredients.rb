class AddQuantityToCocktailIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :cocktail_ingredients, :quantity, :string
  end
end
