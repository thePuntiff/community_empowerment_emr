class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
      t.integer :provider_id
      t.integer :patient_id
      t.string :chief_complaint
      t.string :notes
      t.integer :location_id
      t.integer :approving_provider_id

      t.timestamps
    end
  end
end
