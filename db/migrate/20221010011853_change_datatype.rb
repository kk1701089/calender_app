class ChangeDatatype < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :start, :datetime
    change_column :users, :end, :datetime
  end
end
