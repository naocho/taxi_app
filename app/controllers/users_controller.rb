class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @taxis = user.taxis.order("created_at DESC")
  end
end
