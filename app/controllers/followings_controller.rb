class FollowingsController < ApplicationController
  before_action :get_follow, only: :show
  # before_action :current_follow, if: :current_user?
  def show
    @tweet = Tweet.new
  end
  def get_follow
    @user = User.find(params[:id])
    @follow = @user.all_following
  end

end
