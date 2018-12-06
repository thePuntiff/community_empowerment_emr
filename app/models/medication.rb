class Medication < ApplicationRecord
  # Direct associations

  belongs_to :med_type,
             :required => false

  has_many   :prescriptions

  # Indirect associations

  # Validations
  
  def name_with_dosage
   "#{name} | #{dosage}"
  end

end
