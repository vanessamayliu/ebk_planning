class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :nonprofit_id
      t.date :event_date
      t.text :event_description
      t.boolean :confirmed
      t.integer :number_volunteers
      t.string :event_time_range
      t.string :event_lead

      t.timestamps
    end
  end
end
