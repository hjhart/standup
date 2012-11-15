class AddFirstNameLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :minute_in_day_to_send_morning_standup, :integer
    add_column :users, :minute_in_day_to_send_evening_reminder, :integer
  end
end
