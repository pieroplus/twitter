class UsersController < ApplicationController

  before_action :get_follow, only: :show

  def show
    @url = request.url
    @user = User.find(params[:id])
    @tweet = Tweet.new
    @tweet.images.build
    @tweets = Tweet.includes(:user).order("created_at DESC")
    @recommends = User.where.not(id: @follow).where.not(id: current_user.id)
  end

  def get_follow
    @follow = current_user.all_following
  end

end
