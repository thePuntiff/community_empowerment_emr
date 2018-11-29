require 'rails_helper'

RSpec.describe Prescription, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:patient) }

    it { should belong_to(:provider) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
