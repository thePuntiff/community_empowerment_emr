require 'rails_helper'

RSpec.describe MedType, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:medications) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
