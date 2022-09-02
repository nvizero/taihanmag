class CreateBases < ActiveRecord::Migration[5.0]
  def change
    create_table :bases do |t|
      t.string :tel
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
