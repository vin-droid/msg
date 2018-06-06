class CreateProfessionLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :profession_levels do |t|
      t.string :name, null: false, default: "", index: {unique: true}

      t.timestamps
    end
  end
end
