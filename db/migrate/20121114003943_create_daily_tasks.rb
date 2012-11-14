class CreateDailyTasks < ActiveRecord::Migration
  def change
    create_table :daily_tasks do |t|
      t.text :task
      t.integer :daily_report_id

      t.timestamps
    end
  end
end
