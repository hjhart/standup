require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should accept name and put that into first name, last name properly" do
    user = FactoryGirl.build(:user, :name => "John Doe")
    user.first_name.should == "John"
    user.last_name.should == "Doe"
  end

  context "#yesterdays_daily_tasks" do
    it "should show yesterdays daily_tasks" do

      yesterdays_report = FactoryGirl.build(:daily_report, :created_at => Date.today)
      yesterdays_report = FactoryGirl.build(:daily_report, :created_at => 2.days.ago)
      dt1 = FactoryGirl.build(:daily_task, :daily_report => yesterdays_report)
      dt2 = FactoryGirl.build(:daily_task, :daily_report => yesterdays_report)
      dt3 = FactoryGirl.build(:daily_task, :daily_report => yesterdays_report)

      user = yesterdays_report.user

      user.yesterdays_daily_tasks.should eq [d1, d2]
    end
  end
end