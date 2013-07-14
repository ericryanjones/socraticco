class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @topic }
    end
  end

  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html  { redirect_to(@topic,
                                   :notice => 'Topic was successfully created.') }
        format.json  { render :json => @topic,
                              :status => :created, :location => @topic }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @topic.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @topic }
    end
  end

  def show
    @topic = Topic.find(params[:id])

    @comments = @topic.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@topic, current_user.id, "")
  end

end
