class DailyTask < ActiveRecord::Base
  belongs_to :daily_report
  attr_accessible :daily_report_id, :task
end
