class FollowersController < ApplicationController

  before_action :get_follower, only: :show
  def show
    @tweet = Tweet.new
  end
  def get_follower
    @user = User.find(params[:id])
    @follow = @user.followers
  end


end
