require 'spec_helper'

describe User do
  it "has a valid factory" do
    create(:user).should be_valid
  end

  it "should accept name and put that into first name, last name properly" do
    user = build(:user, :name => "John Doe")
    user.first_name.should == "John"
    user.last_name.should == "Doe"
  end

  context "#yesterdays_tasks" do
    it "should show yesterdays tasks" do
      user = create(:user)
      todays_report = create(:daily_report, :created_at => Date.today, :user => user)
      not_yesterdays_report = create(:daily_report, :created_at => 2.days.ago, :user => user)
      dt1 = create(:daily_task, :daily_report => todays_report)
      dt2 = create(:daily_task, :daily_report => todays_report)
      dt3 = create(:daily_task, :daily_report => not_yesterdays_report)

      user.yesterdays_tasks.should eq [dt1, dt2]
      user.yesterdays_tasks.should_not include dt3
    end
  end

  context "#display_name" do
    it "should show the name method if it exists" do
      user = build(:user, :name => "James Hart")
      user.display_name.should eq "James Hart"
    end

    it "should show the name method if it exists" do
      user = build(:user, :email => "chester@example.com", :first_name => nil, :last_name => nil)
      user.display_name.should eq "chester@example.com"
    end
  end
end