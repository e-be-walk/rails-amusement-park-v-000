class UsersController < ApplicationController

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :happiness,
      :nausea,
      :height,
      :tickets,
      :admin,
    )
  end
end
