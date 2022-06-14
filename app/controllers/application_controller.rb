class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_can_delete?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  def unavailable_request
    unless user_signed_in?
      flash[:error] = 'Вам это недоступно.'
      redirect_to root_path
    end
  end

  def user_can_delete?(entity_owner, meeting_owner)
    return false if current_user.nil?
    current_user == entity_owner || current_user == meeting_owner
  end
end
