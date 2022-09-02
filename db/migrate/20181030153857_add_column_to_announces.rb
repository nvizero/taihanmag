class AddColumnToAnnounces < ActiveRecord::Migration[5.0]
  def up
  	add_column :announces, :flag, :integer
  end

  def down
  	remove_column :announces, :flag
  end
end
