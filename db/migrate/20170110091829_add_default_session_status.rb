class AddDefaultSessionStatus < ActiveRecord::Migration[5.0]
    def change
        change_column_default :sessions, :status, 0
    end
end
