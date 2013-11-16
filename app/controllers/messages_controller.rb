class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  #inbox
  def inbox
    @messages = current_user.received_messages
  end

  def sent
    @messages = current_user.sent_messages
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  #trash
  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end

  def new
    @message = ActsAsMessageable::Message.new
  end

  def create
    @to = User.find_by_id(params[:message][:to])
    current_user.send_message(@to, params[:message][:topic], params[:message][:body])
  end
end
