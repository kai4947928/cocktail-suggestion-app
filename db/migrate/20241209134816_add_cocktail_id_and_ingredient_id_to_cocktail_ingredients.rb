class AddCocktailIdAndIngredientIdToCocktailIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :cocktail_ingredients, :cocktail_id, :integer
    add_column :cocktail_ingredients, :ingredient_id, :integer
  end
end
