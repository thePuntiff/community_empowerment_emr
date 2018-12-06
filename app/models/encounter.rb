class Encounter < ApplicationRecord
  # Direct associations

  belongs_to :location

  has_many   :prescriptions,
             :dependent => :destroy

  belongs_to :patient

  belongs_to :approving_provider,
             :required => false,
             :class_name => "Provider"

  belongs_to :provider

  # Indirect associations

  # Validations

  def name
   "#{created_at.to_date} visit @ #{location.name}"
  end


end
