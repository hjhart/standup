class UserMailer < ActionMailer::Base
  default from: "rpxstandup@gmail.com"

  def evening_reminder(user)
    @user = user
    mail(:to => user.email, :subject => "What'd you do for #{Date.today.strftime("%A, %B %e, %Y")}: #{user.project.name}")
  end

  def morning_standup(user)
    @user = user
    @project = user.project
    mail(:to => user.email, :subject => "Morning standup for #{Date.today.strftime("%A, %B %e, %Y")}: #{@project.name}")
  end
end
