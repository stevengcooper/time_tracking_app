class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
  validates :duration, presence: true
  validates :developer_id, presence: true
  validates :project_id, presence: true

end
