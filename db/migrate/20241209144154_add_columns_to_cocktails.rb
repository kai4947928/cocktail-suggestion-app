class AddColumnsToCocktails < ActiveRecord::Migration[7.2]
  def change
    add_column :cocktails, :alcohol_strength, :string
    add_column :cocktails, :image_url, :string
    add_column :cocktails, :procedure, :text
    add_column :cocktails, :official, :boolean
    add_column :cocktails, :parent_recipe_id, :integer
    add_column :cocktails, :difficulty_id, :integer
    add_column :cocktails, :base_alcohol_id, :integer
  end
end
