require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:nonprofit) }

    end

    describe "InDirect Associations" do

    it { should have_one(:owner_user) }

    end

    describe "Validations" do

    it { should validate_presence_of(:confirmed) }

    it { should validate_presence_of(:nonprofit_id) }

    end
end
