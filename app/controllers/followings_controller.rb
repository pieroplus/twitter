class FollowingsController < ApplicationController
  before_action :get_follow, only: :show
  def show
    @tweet = Tweet.new
  end
  def get_follow
    @user = User.find(params[:id])
    @follow = @user.all_following
    @follower = @user
  end

end
