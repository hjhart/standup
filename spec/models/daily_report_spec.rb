require 'spec_helper'
describe DailyReport do
  it "should have a valid factory" do
    create(:daily_report).should be_valid
  end

  describe "#create_individual_tasks" do
    it "should break apart the lines and create tasks out of them" do
      DailyTask.should_receive(:create!).exactly(4).times.and_return(true)
      plain_text = "item name \n\n\nsomething else\nsome other item\n\n a signature"
      create(:daily_report, :plain_part => plain_text)
    end

    it "should not parse anything after the Hiya email line" do
      DailyTask.should_receive(:create!).exactly(4).times.and_return(true)
      plain_text = "item name \n\n\nsomething else\nsome other item\n\n a signature\n\n\nHiya hjhart@gmail.com\nWhat'd you do today?"
      create(:daily_report, :plain_part => plain_text)
    end

    it "shouldn't parse anything after the From: email line!" do
      plain_text = "Outlook thinks you're special!\r\r\nI did this,\r\r\nI did that.\r\r\nI did just about everything\r\r\n\r\r\nJames Hart | p: 425-835-2366 | skype: rpxjames\r\r\n\r\r\nFrom: James Hart <rpxstandup@gmail.com<mailto:rpxstandup@gmail.com>>\r\r\nDate: Wednesday, November 14, 2012 2:27 PM\r\r\nTo: James Hart <jhart@rpxcorp.com<mailto:jhart@rpxcorp.com>>\r\r\nSubject: What'd you do for Wednesday, November 14, 2012: This is mah project\r\r\n\r\r\nHiya jhart@rpxcorp.com<mailto:jhart@rpxcorp.com>,\r\r\n\r\r\nWhat'd you do today?\r\r\n\r\r\nReply to this email with one line for each task that you completed\r\r\nsomething like\r\r\nthis\r\r\n\r\r\nSee you in the morning!"
      DailyTask.should_receive(:create!).exactly(5).times.and_return(true)
      create(:daily_report, :plain_part => plain_text)
    end
  end

  describe "#yesterdays" do
    xit "is a named scope that should return yesterdays report" do
      new_report = create(:daily_report, :created_at => Date.today)
      old_one = create(:daily_report, :created_at => 15.days.ago)

      DailyReport.yesterdays.should eq new_report
    end
  end
end