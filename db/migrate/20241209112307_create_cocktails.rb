class CreateCocktails < ActiveRecord::Migration[7.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :base_alcohol
      t.string :difficulty

      t.timestamps
    end
  end
end
