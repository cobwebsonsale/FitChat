class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :session_id
      t.string :author
      t.text :text
      t.integer :status

      t.timestamps
    end
  end
end
