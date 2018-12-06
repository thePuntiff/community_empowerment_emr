class AddInstrucitonsToPrescription < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :instructions, :string
  end
end
