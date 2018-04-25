class UsersController < ApplicationController
  before_action :get_follow, only: :show
  before_action :get_user

  def index
  end


  def show
    @name = current_user.name
    @users = User.find(params[:id])
    @url = request.url
    @tweet = Tweet.new
    @tweet.images.build
    @tweets = @user.tweets.order("created_at DESC")
    @recommends = User.where.not(id: @follow).where.not(id: current_user.id)
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

  def get_follow
    @follow = current_user.all_following
  end

  def get_user
    @user = User.find(params[:id])
  end


    private
  def user_params
    params.require(:user).permit(:name,:email)
  end

end
