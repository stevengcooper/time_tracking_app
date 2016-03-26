class Project < ActiveRecord::Base
  has_many :time_entries, dependent: :restrict_with_error
  has_many :developers, through: :time_entries

  def hours_logged
    time_entries.sum(:duration)
  end

  def over_maximum?
    hours_logged > allowed_hours
  end

end
