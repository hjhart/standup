class AddHtmlPartAndPlainTextPartToDailyReport < ActiveRecord::Migration
  def change
    add_column :daily_reports, :plain_part, :text
    add_column :daily_reports, :html_part, :text
    remove_column :daily_reports, :content
  end
end
