class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :daily_reports
  belongs_to :project

  after_create :send_welcome_email

  def send_welcome_email
    self.invite!
  end

  def name=(name)
    self.first_name, self.last_name = name.split(" ")
    name
  end

  def yesterdays_daily_tasks
    daily_report = self.daily_reports.select do |daily_report|
      (1.day.ago..Date.today).cover? daily_report.created_at
    end

    daily_report.daily_tasks
  end
end
