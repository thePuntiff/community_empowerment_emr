class Credential < ApplicationRecord
  # Direct associations

  has_many   :provider_credentials,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
