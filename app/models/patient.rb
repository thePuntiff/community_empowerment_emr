class Patient < ApplicationRecord
  # Direct associations

  belongs_to :sex

  has_many   :prescriptions,
             :dependent => :destroy

  has_many   :encounters,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
