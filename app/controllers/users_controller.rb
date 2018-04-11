class UsersController < ApplicationController
  def show
    @name = current_user.name
    # @screenname
    # @tweets = Tweet.where(user_id: current_user.id)
  end
end
