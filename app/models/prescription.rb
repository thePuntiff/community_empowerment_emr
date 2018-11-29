class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :encounter

  belongs_to :patient,
             :counter_cache => true

  belongs_to :provider

  # Indirect associations

  # Validations

end
