class CreateProfessionAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :profession_areas do |t|
      t.string :name, null: false, default: "", index: {unique: true}

      t.timestamps
    end
  end
end
