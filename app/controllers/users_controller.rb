class UsersController < ApplicationController

  before_action :get_follow, only: :show
  before_action :get_user


  def show
    @url = request.url
    @tweet = Tweet.new
    @tweet.images.build
    @tweets = @user.tweets.order("created_at DESC")
    @recommends = User.where.not(id: @follow).where.not(id: current_user.id)
  end

  def get_follow
    @follow = current_user.all_following
  end

  def get_user
    @user = User.find(params[:id])
  end

end
