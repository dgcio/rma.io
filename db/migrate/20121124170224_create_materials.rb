class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
    	t.string :name
    	t.string :artwork
    	t.string :amount_left
    	t.string :amount_per_box
    	t.string :notes

      t.timestamps
    end
  end
end
