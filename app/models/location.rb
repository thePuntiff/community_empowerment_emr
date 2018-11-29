class Location < ApplicationRecord
  # Direct associations

  has_many   :encounters,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
