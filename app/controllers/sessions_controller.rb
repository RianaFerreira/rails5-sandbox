class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def new
  end

  def create
    if @current_user.present?
      session[:user_id] = @current_user.id
      redirect_to ideas_path
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path, notice: "Signed out!"
  end

  private

  def authenticate_user
    # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

    @current_user ||= User.find_by_email(session_params[:email])&.
      authenticated(session_params[:password])
  end

  def session_params
    params.permit(:email, :password)
  end
end
