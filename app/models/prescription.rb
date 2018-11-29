class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :medication

  belongs_to :encounter

  belongs_to :patient,
             :counter_cache => true

  belongs_to :provider

  # Indirect associations

  has_one    :med_type,
             :through => :medication,
             :source => :med_type

  # Validations

end
