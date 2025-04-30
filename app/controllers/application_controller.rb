class ApplicationController < ActionController::API
  # include Authentication
  include ActionController::Cookies
  before_action :authorize_request

  # This method checks if a current user is authorized
  def authorize_request
    render json: { error: 'Not authorized' }, status: :unauthorized unless current_user
  end

  def current_user
    # Assuming you have a header 'Authorization' that contains the token
    @current_user ||= Lister.find_by(auth_token: request.headers['Authorization'])
  end
end
