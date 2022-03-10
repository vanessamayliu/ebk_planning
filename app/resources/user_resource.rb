class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :nonprofits,
             foreign_key: :owner_user_id

  # Indirect associations

  has_many :events do
    assign_each do |user, events|
      events.select do |e|
        e.id.in?(user.events.map(&:id))
      end
    end
  end

end
