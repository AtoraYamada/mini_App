class MessagesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end
  
  def new
    @message=Message.new
  end

  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = 'メッセージを入力してください'
      render :new
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:body, :picture).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to :index unless user_signed_in?
  end
end
