class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_url
  end

  def index
    @links = Link.all
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
