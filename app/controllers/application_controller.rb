class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize_request

  def authorize_request
    Rails.logger.debug "Authorization header: #{request.headers['Authorization']}"
    render json: { error: 'Not authorized' }, status: :unauthorized unless current_user
  end

  def current_user
      token = request.headers['Authorization'].to_s.split(' ').last
    @current_user ||= Lister.find_by(auth_token: token)
  end
end