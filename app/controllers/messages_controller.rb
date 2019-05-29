class MessagesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @messages=Message.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end
  
  def new
    @message=Message.new
  end

  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @message=Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.update(message_params)
    end
    redirect_to user_path(message.user)
  end

  private
  def message_params
    params.require(:message).permit(:body, :picture).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to :index unless user_signed_in?
  end
end
