json.extract! event, :id, :nonprofit_id, :event_date, :event_description,
              :confirmed, :number_volunteers, :event_time_range, :event_lead, :created_at, :updated_at
json.url event_url(event, format: :json)
