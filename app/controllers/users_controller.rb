class UsersController < ApplicationController 
  def destroy
    @project = Project.find(params[:project_id]) if params[:project_id]
    @user = User.find(params[:id])
    @user.destroy
    redirect_to project_path(@project)
  end   
end
