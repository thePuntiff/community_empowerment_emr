require 'rails_helper'

RSpec.describe ProviderCredential, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:provider) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
