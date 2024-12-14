class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :alcohol_strength
      t.string :image_url
      t.text :procedure
      t.boolean :official
      t.string :parent_recipe_id
      t.integer :difficulty_id
      t.integer :base_liquor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
