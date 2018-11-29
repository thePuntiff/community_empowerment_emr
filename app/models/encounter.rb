class Encounter < ApplicationRecord
  # Direct associations

  belongs_to :approving_provider,
             :required => false,
             :class_name => "Provider"

  belongs_to :provider

  # Indirect associations

  # Validations

end
