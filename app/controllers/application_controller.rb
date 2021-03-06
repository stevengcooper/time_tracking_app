class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def authenticate
    redirect_to dashboards_index_path, notice: "Please Login First" unless Developer.find_by(id: session[:user_id])
  end

end
