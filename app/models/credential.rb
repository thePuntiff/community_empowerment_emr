class Credential < ApplicationRecord
  # Direct associations

  has_many   :provider_credentials,
             :dependent => :destroy

  # Indirect associations

  has_many   :providers,
             :through => :provider_credentials,
             :source => :provider

  # Validations

end
