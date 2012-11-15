class DailyTask < ActiveRecord::Base
  belongs_to :daily_report
  attr_accessible :daily_report_id, :task

  validates_presence_of :daily_report
end
