class UsersController < ApplicationController
  def show
    @messages=Message.where(user_id: params[:id]).order('created_at DESC').page(params[:page]).per(5)
  end
end
