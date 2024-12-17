class CreateRecipeIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity

      t.timestamps
    end
  end
end
