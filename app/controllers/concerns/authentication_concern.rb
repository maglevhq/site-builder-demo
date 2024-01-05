module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def verify_user_authorization
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

end