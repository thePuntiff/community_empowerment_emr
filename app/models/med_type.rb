class MedType < ApplicationRecord
  # Direct associations

  has_many   :medications,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
