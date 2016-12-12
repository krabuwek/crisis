class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :phone, :string
    add_column :users, :dob, :date
    add_column :users, :company, :string
    add_column :users, :position, :string
    add_column :users, :business_achievements, :text
  end
end
