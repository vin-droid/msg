class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :dob
      t.string :mobile
      t.integer :gender
      t.integer :highest_education
      t.string :salary
      t.string :address
      t.integer :city_id
      t.integer :state_id
      t.integer :profession_id
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :profession, foreign_key: true

      t.timestamps
    end
  end
end
