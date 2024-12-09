class ChangeCocktails < ActiveRecord::Migration[7.2]
  def change
    change_table :cocktails do |t|
      t.string :name
      t.integer :alcohol_strength
      t.string :image_url
      t.text :procedure
      t.boolean :official
      t.integer :parent_recipe_id
      t.integer :difficulty_id
      t.integer :base_alcohol_id
    end
  end
end
