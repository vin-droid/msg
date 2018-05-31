class CreateProfessionAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :profession_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
