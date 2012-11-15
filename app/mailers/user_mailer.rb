class UserMailer < ActionMailer::Base
  default from: "rpxstandup@gmail.com"

  def evening_reminder(user)
    @user = user
    mail(:to => user.email, :subject => "What'd you do for #{Date.today.strftime("%A, %B %e, %Y")}: #{user.project.name}")
  end
end
