require 'rails_helper'

RSpec.describe Sex, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:patients) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
