class UsersController < ApplicationController

  def index
  end

  def show
    # @screenname = user.name
    @name = current_user.name
    # @tweets = Tweet.where(user_id: current_user.id)
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
    @users = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
