class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name], keys: [:screen_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name], keys: [:screen_name])
  end

  def after_sign_out_path_for(resource)
  '/users/sign_in' # サインアウト後のリダイレクト先URL
  end

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  def follow
    @user = User.find(params[:id])
    if current_user
      if current_user == @user
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
        flash[:notice] = "You are now following #{@user.name}."
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.name}."
      redirect_to :back
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.name}.".html_safe
      redirect_to :back
    end
  end

end
