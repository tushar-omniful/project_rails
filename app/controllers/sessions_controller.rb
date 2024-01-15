class SessionsController < ApplicationController

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    if user
      login user
      render json: "login successfully"
    else
      render json: "authentication failed", status: :unauthorized
    end
  end
  def destroy
    logout
    render json: "logout"
  end
end