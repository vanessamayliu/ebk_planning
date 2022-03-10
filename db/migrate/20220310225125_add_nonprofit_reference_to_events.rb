class AddNonprofitReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :nonprofits
    add_index :events, :nonprofit_id
    change_column_null :events, :nonprofit_id, false
  end
end
