class RemoveNullConstraintsFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true
    change_column_null :users, :personal_id, true
    change_column_null :users, :birth_date, true
    change_column_null :users, :gender, true
  end
end
