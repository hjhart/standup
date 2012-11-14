class DailyReportHandler < ActionMailer::Base
  def receive(message)
    sender = User.find_by_email(message.from.first)
    puts "The user was not found in the database that sent you an email #{message.from.first}" if (sender.nil?)

    puts "from: #{message.from}, subject: '#{message.subject}'"
    puts "The body should be clean below!"

    plain_part = message.multipart? ? (message.text_part ? message.text_part.body.decoded : nil) : message.body.decoded
    html_part = message.html_part ? message.html_part.body.decoded : nil

    daily_report = DailyReport.create(:plain_part => plain_part, :html_part => html_part, :user_id => sender.id)
    daily_report.create_individual_tasks
  end
end