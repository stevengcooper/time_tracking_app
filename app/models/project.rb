class Project < ActiveRecord::Base
  has_many :time_entries
  has_many :developers, through: :time_entries
end
