class DailyReport < ActiveRecord::Base
  attr_accessible :plain_part, :html_part, :user_id

  belongs_to :user
  has_many :daily_tasks

  before_save :create_individual_tasks

  scope :yesterdays, :conditions => ["created_at <= ? AND created_at >= ?", Time.current, (Time.current - 24.hours)], :limit => 1

  validates_presence_of :user

  def create_individual_tasks
    return if self.plain_part.nil?
    self.plain_part.split("\n").compact.each do |line|
      next if line.blank?
      break if line.match /Hiya/
      break if line.match /^From: /
      DailyTask.create!(:task => line, :daily_report_id => self.id)
    end
  end
end
