require 'spec_helper'
describe DailyReport do
  describe "#create_individual_tasks" do
    it "should break apart the lines and create tasks out of them" do
      DailyTask.should_receive(:create!).exactly(4).times.and_return(true)
      plain_text = "item name \n\n\nsomething else\nsome other item\n\n a signature"
      daily_report = DailyReport.create!(:plain_part => plain_text)
      daily_report.create_individual_tasks
    end

    it "should not parse anything after the Hiya email line" do
      DailyTask.should_receive(:create!).exactly(4).times.and_return(true)
      plain_text = "item name \n\n\nsomething else\nsome other item\n\n a signature\n\n\nHiya hjhart@gmail.com\nWhat'd you do today?"
      daily_report = DailyReport.create!(:plain_part => plain_text)
      daily_report.create_individual_tasks
    end
  end
end