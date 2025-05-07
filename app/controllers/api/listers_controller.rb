class Api::ListersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]
  def create
    if Lister.exists?(email: params[:session][:email])
      render json: { error: "User with email already exists" }, status: :conflict
    else
      lister = Lister.create!(email: params[:session][:email], password: params[:session][:password])
      if lister.save
        user = lister
        if user.authenticate(params[:session][:password])
          user.regenerate_auth_token
          render json: { auth_token: user.auth_token, email: user.email }, status: :created
        else
          render json: { error: "Login failed after creation." }, status: :unauthorized
        end
      else
        render json: { errors: lister.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
