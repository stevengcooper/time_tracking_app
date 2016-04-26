class DevelopersController < ApplicationController
  before_action :set_developer, only: [:edit, :update, :destroy]
  before_action :authenticate, except: [:new, :create]

  def index
    @developer = Developer.where(id: session[:user_id])
    @developers = Developer.all
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      session[:user_id] = @developer.id
      redirect_to root_path, notice: 'Developer was successfully created.'
    else
      flash.now[:alert] = "Something went wrong. Sorry for your loss of time."
      redirect_to dashboards_index_path
    end
  end

  def edit
  end

  def destroy
    @developer.delete
    redirect_to root_path, notice: 'Developer was destroyed with extreem prejudice.'
  end

  def show
    @developer = Developer.find_by(id: params[:id])
  end

  def update
    if @developer.update(developer_params)
      redirect_to developers_path, notice: "Developer was updated with success."
    else
      render :index
    end
  end

  def new
    @developer = Developer.new
  end

  private
    def set_developer
      @developer = Developer.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(:id, :email, :password, :first_name, :last_name)
    end
end
