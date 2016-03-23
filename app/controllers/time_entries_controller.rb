class TimeEntriesController < ApplicationController
  def new
    @developers = Developer.all
    @time_entry = TimeEntry.new
    @projects = Project.all
  end

  def create
    @time_entry = TimeEntry.new(params[:id])

    if @time_entry.save
      redirect_to developers_index_path, notice: 'Time Entry was successfully created.'
    else
      render :new, notice: "Couldn't save the Time Entry"
    end
  end

  def edit
  end

  def delete
  end

  def show
  end

  def index
  end
end
