class ChangeCocktailIngredients < ActiveRecord::Migration[7.2]
  def change
    change_table :cocktail_ingredients do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
      t.string :quantity
    end
  end
end
