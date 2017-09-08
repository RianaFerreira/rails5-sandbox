class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def new
  end

  def create
    redirect_to sign_in_redirect, flash: sign_in_flash_message
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path, flash: {success: "Signed out!"}
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def authenticate_user
    # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

    @current_user ||= User.find_by_email(session_params[:email])&.
      authenticated(session_params[:password])
  end

  def sign_in_redirect
    set_session_user ?  ideas_path : welcome_path
  end

  def set_session_user
    return if @current_user.blank?
    session[:user_id] = @current_user.id
  end

  def sign_in_flash_message
    if session[:user_id].present?
      { success: "Signed in!" }
    else
      { error: "Invalid email or password!" }
    end
  end
end
