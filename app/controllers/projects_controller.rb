class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :set_developer, only: [:edit, :update, :destroy]
  
  def index
  end

  def create
  end

  def edit
  end

  def delete
  end


  def show

  end
end
