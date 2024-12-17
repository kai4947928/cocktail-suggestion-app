class CreateBaseLiquors < ActiveRecord::Migration[7.2]
  def change
    create_table :base_liquors do |t|
      t.string :name

      t.timestamps
    end
  end
end
