module Api
  class Api::SessionsController < ApplicationController
    skip_before_action :authorize_request, only: [:create]
  
    def create
      user = Lister.find_by(email: params[:session][:email])
  
      if user&.authenticate(params[:session][:password])
        user.regenerate_auth_token
        render json: { auth_token: user.auth_token, email: user.email }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    def destroy
      current_user&.regenerate_auth_token
      render json: { message: "Logged out successfully." }
    end
  end  
end