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

end
