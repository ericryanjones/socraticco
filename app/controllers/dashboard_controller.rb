class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @my_topics = Topic.find_all_by_user_id(current_user.id)

    if params[:search].present?
      @users = User.near(params[:search], 50, :order => :distance)
    else
      @users = User.new()
    end
  end
end
