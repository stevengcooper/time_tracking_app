class Project < ActiveRecord::Base
  has_many :time_entries, dependent: :destroy
  has_many :developers, through: :time_entries

  def self.hours_logged
    TimeEntry.where(project_id: @self.id).each {|time| time.allowed_hours += 0 }
  end

end
