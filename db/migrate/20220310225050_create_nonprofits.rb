class CreateNonprofits < ActiveRecord::Migration[6.0]
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.string :category
      t.text :mission
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.integer :owner_user_id
      t.text :status
      t.text :notes

      t.timestamps
    end
  end
end
