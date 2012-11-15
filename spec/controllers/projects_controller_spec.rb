require 'spec_helper'

describe ProjectsController do
  context "GET :show" do
    it "should set the project assign to the proper project" do
      project = create(:project)
      get :show, id: project
      assigns(:project).should eq project
    end

    it "should render the show view" do
      project = create(:project)
      get :show, id: project
      response.should render_template(:show)
    end
  end

  context "POST :create" do
    it "should do something with the goods we passed to it!" do
      expect {
        post :create, project: attributes_for(:project)
      }.to change(Project, :count).by(1)
    end

    it "should not change the model if invalid goods are passed to it!" do
      expect {
        post :create, project: attributes_for(:invalid_project)
      }.to_not change(Project, :count)
    end
  end

  context "DELETE :destroy" do
    it "should delete a record!" do
      project = create(:project)
      expect {
        delete :destroy, id: project
      }.to change(Project, :count).by(-1)
    end
  end
end