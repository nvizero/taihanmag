class AddColumnToCatesFlag < ActiveRecord::Migration[5.0]
  def up
  	add_column :cates, :flag, :integer
  end

  def down
  	remove_column :cates, :flag
  end
end
