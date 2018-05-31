class CreateProfessionLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :profession_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
