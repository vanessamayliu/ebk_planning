class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :nonprofit_id, :integer
  attribute :event_date, :date
  attribute :event_description, :string
  attribute :confirmed, :boolean
  attribute :number_volunteers, :integer
  attribute :event_time_range, :string
  attribute :event_lead, :string

  # Direct associations

  belongs_to :nonprofit

  # Indirect associations

  has_one    :owner_user,
             resource: UserResource

  filter :owner_user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:owner_user).where(nonprofits: { owner_user_id: value })
    end
  end
end
