class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.integer :provider_id
      t.integer :encounter_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
