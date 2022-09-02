class AddColumnToCodata < ActiveRecord::Migration[5.0]
  def up
  	add_column :codata, :address, :string
  end

  def down
  	remove_column :codata, :address
  end
end
