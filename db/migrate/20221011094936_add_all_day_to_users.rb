class AddAllDayToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :all_day, :boolean
  end
end
