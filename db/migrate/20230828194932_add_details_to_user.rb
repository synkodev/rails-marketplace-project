class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :personal_id, null: false
      t.date    :birth_date, null: false
      t.string  :gender, null: false, limit: 15
      t.string  :phone_number, default: ""
      t.string  :address, default: ""
      t.boolean :terms_conditions
    end
  end
end
