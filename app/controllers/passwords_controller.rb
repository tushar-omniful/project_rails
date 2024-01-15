class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(password_params)
      render json: "password update successfully"
    else
      render json: "something went wrong"
    end
  end

  private
  def password_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :password_challenge
    ).with_defaults(password_challenge: "")

    #with_defaults ensure password_challenge is always available so that current password can be checked.
    #password_challenge : to match with current password in db

  end
end