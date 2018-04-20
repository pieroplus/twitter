class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweet.images.build
    @tweets = Tweet.includes(:user).order("created_at DESC")
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

end
