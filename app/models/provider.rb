class Provider < ApplicationRecord
  # Direct associations

  has_many   :approved_encounters,
             :class_name => "Encounter",
             :foreign_key => "approving_provider_id"

  has_many   :prescriptions

  has_many   :encounters

  has_many   :provider_credentials,
             :dependent => :destroy

  # Indirect associations

  has_many   :credentials,
             :through => :provider_credentials,
             :source => :credential

  def fullname
   "#{firstname} #{lastname}"
  end

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
