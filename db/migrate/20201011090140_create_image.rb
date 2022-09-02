class CreateImage < ActiveRecord::Migration[5.0]
  def up
    create_table :images do |t|
      t.string :file
      t.string :alt
      t.string :hint

      t.timestamps
    end
  end

  def down
    drop_table :images 
  end
end
