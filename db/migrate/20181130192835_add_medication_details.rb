class AddMedicationDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :medications, :dosage, :string
  end
end