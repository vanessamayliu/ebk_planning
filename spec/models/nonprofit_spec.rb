require "rails_helper"

RSpec.describe Nonprofit, type: :model do
  describe "Direct Associations" do
    it { should have_many(:events) }

    it { should belong_to(:owner_user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:contact_email) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:owner_user_id) }

    it { should validate_presence_of(:status) }
  end
end
