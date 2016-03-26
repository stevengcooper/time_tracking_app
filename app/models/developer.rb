class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries, dependent: :restrict_with_error
  belongs_to :project
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  before_destroy :destroy_developer

  def name
    "#{first_name} #{last_name}"
  end

  def weekly_hours
    time_entries.where(date: (Date.today.beginning_of_week..Date.today.end_of_week)).sum(:duration)

  end
end
