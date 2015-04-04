class AddDepartmentToMats < ActiveRecord::Migration
  def change
    add_column :mats, :department, :string
  end
end
