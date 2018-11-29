class Sex < ApplicationRecord
  # Direct associations

  has_many   :patients,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
