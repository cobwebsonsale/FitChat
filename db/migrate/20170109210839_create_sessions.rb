class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :user_id_to
      t.integer :user_id_from
      t.integer :status

      t.timestamps
    end
  end
end
