class SessionsController < ApplicationController
  # before_action :authenticate, only: [:edit, :update, :destroy]

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
      byebug
      flash.now[:alert] = "Incorrect login information.  Please try again"
      render :new
    end
  end

  def update
    @developer = Developer.find_by(email: user_params[:email])
    if @developer && @developer.authenticate(user_params[:password])
      @developer.update(password: session_params[:new_password])
      redirect_to root_path, notice: "Password has been changed"
    else
      flash.now[:alert] = "Old Password Does Not Match!"
      render :edit
    end
  end

  def destroy
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
