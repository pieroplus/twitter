class UsersController < ApplicationController

  def index
  end

  def show
    # @screenname = user.screenname
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
      redirect_to user_path
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
