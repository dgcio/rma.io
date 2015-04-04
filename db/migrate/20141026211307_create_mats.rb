class CreateMats < ActiveRecord::Migration
  def change
    create_table :mats do |t|
      t.string :name
      t.string :artwork
      t.integer :amount_left
      t.integer :amount_per_box
      t.string :wh_position

      t.timestamps
    end
  end
end
