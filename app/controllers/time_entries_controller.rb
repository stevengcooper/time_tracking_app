class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    if @time_entry.save
      redirect_to developers_path, notice: 'Time Entry was successfully created.'
    else
      flash.now[:notice]= "Fill Every Field!"
      render :new
    end
  end

  def destroy
    @time_entry.destroy
    redirect_to root_path, notice: 'Time Entry destroyed with extreem prejudice.'
  end

  def index
    @time_entries = TimeEntry.where(developer_id: session[:user_id])
  end

  def show
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to time_entries_path, notice: "Time Entry updated with success!"
    else
      render :index
    end
  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:id, :duration, :date, :developer_id, :project_id)
    end
end
