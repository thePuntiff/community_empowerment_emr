require 'rails_helper'

RSpec.describe Patient, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sex) }

    it { should have_many(:prescriptions) }

    it { should have_many(:encounters) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
