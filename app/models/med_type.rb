class MedType < ApplicationRecord
  # Direct associations

  has_many   :medications,
             :dependent => :nullify

  # Indirect associations

  has_many   :prescriptions,
             :through => :medications,
             :source => :prescriptions

  # Validations

end
