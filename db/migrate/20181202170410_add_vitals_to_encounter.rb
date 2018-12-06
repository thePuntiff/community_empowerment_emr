class AddVitalsToEncounter < ActiveRecord::Migration[5.1]
  def change
      add_column :encounters, :weight, :numeric
      add_column :encounters, :height, :numeric
      add_column :encounters, :blood_pressure, :string
      add_column :encounters, :temperature, :decimal
  end
end