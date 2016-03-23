class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  def name
    "#{first_name} #{last_name}"
  end


end
