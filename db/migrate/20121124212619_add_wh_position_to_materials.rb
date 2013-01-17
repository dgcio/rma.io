class AddWhPositionToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :wh_position, :string
    change_column :materials, :amount_left, :integer
    change_column :materials, :amount_per_box, :integer
  end
end
