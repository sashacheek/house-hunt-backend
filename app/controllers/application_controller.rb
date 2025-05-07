class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize_request

  def authorize_request
    render json: { error: 'Not authorized' }, status: :unauthorized unless current_user
  end

  def current_user
    @current_user ||= Lister.find_by(auth_token: request.headers['Authorization'])
  end
end