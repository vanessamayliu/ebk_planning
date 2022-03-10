class NonprofitResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :category, :string
  attribute :mission, :string
  attribute :contact_name, :string
  attribute :contact_email, :string
  attribute :contact_phone, :string
  attribute :owner_user_id, :integer
  attribute :status, :string
  attribute :notes, :string

  # Direct associations

  belongs_to :owner_user,
             resource: UserResource

  # Indirect associations

end
