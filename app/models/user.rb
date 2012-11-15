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

  def name
    if(self.first_name.nil?)
      return nil
    elsif self.last_name.nil?
      return self.first_name
    else
      [self.first_name, self.last_name].join(" ")
    end
  end

  def name=(name)
    self.first_name, self.last_name = name.split(" ")
    name
  end

  def yesterdays_tasks
    self.daily_reports.yesterdays.first.daily_tasks
  end

  def display_name
    if(self.name.nil?)
      self.email
    else
      self.name
    end
  end
end
