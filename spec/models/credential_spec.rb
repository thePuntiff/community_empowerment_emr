require 'rails_helper'

RSpec.describe Credential, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:provider_credentials) }

    end

    describe "InDirect Associations" do

    it { should have_many(:providers) }

    end

    describe "Validations" do
      
    end
end
