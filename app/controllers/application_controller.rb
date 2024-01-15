class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private
  def authenticate_user!
    render json: "authenticate first" unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end


  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout
    Current.user = nil
    reset_session
  end

end
