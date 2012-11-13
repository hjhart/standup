class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
