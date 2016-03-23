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
      flash.now[:notice]= "ooooo"
      render :new
    end
  end

  def delete
    @time_entry.destroy
    redirect_to root_path, notice: 'time_entry was destroyed with extreem prejudice.'
  end

  def index
    @time_entries = TimeEntry.all
  end

  def show
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to time_entries_index_path, "Time entry was created with success."
    else
      render :index
    end
  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:duration, :date, :developer_id, :project_id)
    end
end
