class AddColumnToCodata2 < ActiveRecord::Migration[5.0]
  def up
  	add_column :codata, :address_en, :string
  end

  def down
  	remove_column :codata, :address_en
  end
end
