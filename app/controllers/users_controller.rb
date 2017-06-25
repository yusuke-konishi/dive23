class UsersController < ApplicationController
  def index
    @users =  User.last(36)
  end

  def show
    @user = User.find(params[:id])
  end
end
