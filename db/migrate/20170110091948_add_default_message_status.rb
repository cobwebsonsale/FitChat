class AddDefaultMessageStatus < ActiveRecord::Migration[5.0]
    def change
		change_column_default :messages, :status, 0
    end
end
