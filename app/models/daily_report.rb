class DailyReport < ActiveRecord::Base
  attr_accessible :plain_part, :html_part, :user_id

  belongs_to :user
  has_many :daily_tasks

  def create_individual_tasks
    self.plain_part.split("\n").compact.each do |line|
      next if line.blank?
      break if line.match /Hiya/
      DailyTask.create!(:task => line, :daily_report_id => self.id)
    end
  end
end
