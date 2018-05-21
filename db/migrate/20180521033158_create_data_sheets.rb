class CreateDataSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :data_sheets do |t|
      t.integer :admin_id
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
