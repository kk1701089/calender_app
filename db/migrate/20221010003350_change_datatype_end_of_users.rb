class ChangeDatatypeEndOfUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :end, :date
  end
end
