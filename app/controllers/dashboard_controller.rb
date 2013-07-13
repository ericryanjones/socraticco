class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @my_topics = Topic.find_all_by_user_id(current_user.id)
  end
end
