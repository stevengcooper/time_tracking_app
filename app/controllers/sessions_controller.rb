class SessionsController < ApplicationController
  before_action :authenticate, only: [:edit, :update, :delete]
  before_action :authenticate, except: [:new, :create]
  

  def new
    @developer = Developer.new
  end

  def edit
    @developer = Developer.find(session[:user_id])
  end

  def create
    @developer = Developer.find_by(email: params[:email])
    if @developer && @developer.authenticate(params[:password])
      session[:user_id] = @developer.id
      redirect_to root_path, notice: "Login Great Success"
    else
      flash.now[:alert] = "Incorrect login information.  Please try again"
      redirect_to new_path
    end
  end

  def update
    @developer = Developer.find_by(email: params[:email])
    if @developer && @developer.authenticate(params[:password])
      @developer.update(password: session_params[:new_password])
      redirect_to root_path, notice: "Password has been changed"
    else
      flash.now[:alert] = "Old Password Does Not Match!"
      redirect_to root_path
    end
  end

  def delete
    session[:user_id] = nil
    session[:session_id] = nil
    redirect_to dashboards_index_path, notice: "Logged out"
  end

  private
    def session_params
      params.require(:form_fields).permit(:email, :password)
    end

    def set_developer
      @developer = Developer.find(params[:id])
    end
end
