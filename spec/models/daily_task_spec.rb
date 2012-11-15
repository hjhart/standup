require 'spec_helper'

describe DailyTask do
  it "should have a valid factory" do
    FactoryGirl.create(:daily_task).should be_valid
  end

  it "should require a daily report associated with it" do
    FactoryGirl.build(:daily_task, :daily_report => nil).should_not be_valid
  end
end