class TweetsController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :get_followuser, only: :index

  def index
    @tweet = Tweet.new
    @tweet.images.build
    @tweets = Tweet.where(user_id: @indicate).order("created_at DESC")
    @users = current_user
    @recommends = User.where.not(id: @follow).where.not(id: current_user.id)
    @tweetnumber = Tweet.where(user_id: current_user.id).count(:user_id)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to action: 'index'
  end

  private
  def tweet_params
    params.require(:tweet).permit(
      :text,
      :user_id,
      images_attributes: [:content])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(
      :id)
  end

  def get_followuser
    @follow = current_user.all_following
    @indicate = User.where(id: [@follow, current_user.id])
  end

end
