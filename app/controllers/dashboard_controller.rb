class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @my_topics = Topic.find_all_by_user_id(current_user.id)

    if params[:search].present?
      @user_search = User.near(params[:search], 50, :order => :distance)
    else
      @user_search = NIL
    end
  end
end
