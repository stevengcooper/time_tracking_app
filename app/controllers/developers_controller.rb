class DevelopersController < ApplicationController
  before_action :set_developer, only: [:edit, :update, :destroy]

  def index
    @developers = Developer.all
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      redirect_to developers_index_path, notice: "Developer was created with success."
    else
      render :new
    end
  end

  def edit
  end

  def delete
    @developer.destroy
    redirect_to root_path, notice: 'Developer was destroyed with extreem prejudice.'
  end

  def show
  end

  def update
    if @author.update(developer_params)
      redirect_to developers_index_path, "Developer was created with success."
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
      params.require(:developer).permit(:email, :password, :first_name, :last_name)
    end
end
