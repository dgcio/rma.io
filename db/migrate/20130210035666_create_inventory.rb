class CreateInventory < ActiveRecord::Migration
  def up
    create_table :inventories do |t|
      t.text :name
      t.text :artwork
      t.integer :amount_left
      t.integer :amount_per_box
      t.text :notes
      t.text :department
      t.text :wh_position

      t.timestamps
    end	  
  end

  def down
  end
end
