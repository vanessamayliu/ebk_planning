require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:confirmed) }

    it { should validate_presence_of(:nonprofit_id) }

    end
end
