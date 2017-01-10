class FixSessionColumnNames < ActiveRecord::Migration[5.0]
  	def change
  		rename_column :sessions, :user_id_to, :user_to_id
  		rename_column :sessions, :user_id_from, :user_from_id
  	end
end
