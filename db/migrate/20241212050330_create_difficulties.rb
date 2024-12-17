class CreateDifficulties < ActiveRecord::Migration[7.2]
  def change
    create_table :difficulties do |t|
      t.string :name

      t.timestamps
    end
  end
end
