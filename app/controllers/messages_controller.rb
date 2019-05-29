class MessagesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @message=Message.new
  end

  def new
  end

  private
  def move_to_index
    redirect_to :index unless user_signed_in?
  end
end
