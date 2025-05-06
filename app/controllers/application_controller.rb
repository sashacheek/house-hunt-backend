class ApplicationController < ActionController::API
  include Authentication
  include ActionController::Cookies
  include ActionController::Helpers
  before_action :authorize_request

  attr_reader :current_user

  def authorize_request
    token = request.headers['Authorization']&.split(' ')&.last
    @current_user = Lister.find_by(auth_token: token)
    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end

  def current_user
    @current_user ||= Lister.find_by(auth_token: request.headers['Authorization'])
  end
end
