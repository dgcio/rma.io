class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.integer :mats_id
      t.text :product_id
      t.integer :amount
      t.text :type

      t.timestamps
    end
  end
end
