class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.integer :id
      t.integer :serial, :limit => 8
      t.string :model

      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end
