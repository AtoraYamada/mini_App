class MessagesController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :get_message, only: [:edit, :update, :destroy]

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
  end

  def update
    @message.update(message_params) if @message.user_id == current_user.id
    redirect_to user_path(@message.user)
  end

  def destroy
    @message.destroy if @message.user_id == current_user.id
    redirect_to user_path(@message.user)
  end

  private
  def message_params
    params.require(:message).permit(:body, :picture).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to :index unless user_signed_in?
  end

  def get_message
    @message = Message.find(params[:id])
  end
end
