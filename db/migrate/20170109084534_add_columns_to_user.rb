class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :user_type, :integer
    add_index :users, :username, unique: true
  end
end
