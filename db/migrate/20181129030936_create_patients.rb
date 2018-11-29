class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.integer :sex_id
      t.date :dob
      t.string :phone_num

      t.timestamps
    end
  end
end
