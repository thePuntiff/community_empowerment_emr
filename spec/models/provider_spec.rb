require 'rails_helper'

RSpec.describe Provider, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:prescriptions) }

    it { should have_many(:encounters) }

    it { should have_many(:provider_credentials) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
