class AddOwnerUserReferenceToNonprofits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :nonprofits, :users, column: :owner_user_id
    add_index :nonprofits, :owner_user_id
    change_column_null :nonprofits, :owner_user_id, false
  end
end
