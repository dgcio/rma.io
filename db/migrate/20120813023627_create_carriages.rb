class CreateCarriages < ActiveRecord::Migration
  def self.up
    create_table :carriages do |t|
      t.integer :serial, :limit => 8
      t.string :model
      t.string :orientation
      t.string :stype
      t.integer :motor
      t.integer :pcb
      t.string :status
      t.string :warehouse_point
      t.integer :orderno

      t.timestamps
    end
  end

  def self.down
    drop_table :carriages
  end
end
