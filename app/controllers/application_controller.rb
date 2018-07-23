class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  before_action :search

  def after_sign_up_path_for(resource)
    user_path(@user)
  end

  def search
      @q = Spot.ransack(params[:q])
  end

  protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :name_phonetic, :nick_name, :prefecture_id])
   devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :name_phonetic, :nick_name])
 end

end
