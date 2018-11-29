class ProviderCredential < ApplicationRecord
  # Direct associations

  belongs_to :credential

  belongs_to :provider

  # Indirect associations

  # Validations

end
