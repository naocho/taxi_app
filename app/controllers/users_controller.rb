class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @taxis = current_user.taxis
  end
end
