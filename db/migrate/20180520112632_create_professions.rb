class CreateProfessions < ActiveRecord::Migration[5.2]
  def change
    create_table :professions do |t|
      t.string :field_name, null: false, default: "", index: {unique: true}

      t.timestamps
    end
  end
end
