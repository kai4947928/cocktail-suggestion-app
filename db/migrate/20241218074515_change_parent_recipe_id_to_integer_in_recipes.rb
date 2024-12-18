class ChangeParentRecipeIdToIntegerInRecipes < ActiveRecord::Migration[7.2]
  def change
    change_column :recipes, :parent_recipe_id, :bigint
    add_foreign_key :recipes, :recipes, column: :parent_recipe_id
  end
end
