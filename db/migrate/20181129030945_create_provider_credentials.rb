class CreateProviderCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :provider_credentials do |t|
      t.integer :provider_id
      t.integer :credential_id

      t.timestamps
    end
  end
end
