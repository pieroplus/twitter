class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    if current_user
      if current_user == @user　
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
        flash[:notice] = "You are now following #{@user.name}."
        redirect_to @user
      end
    else
      redirect_to root_path
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.name}."
      redirect_to @user
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.name}.".html_safe
      redirect_to @user
    end
  end
end
