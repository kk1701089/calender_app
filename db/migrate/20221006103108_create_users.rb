class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :title
      t.string :start
      t.string :end
      t.string :confirmation
      t.string :editing
      t.string :delet

      t.timestamps
    end
  end
end
