require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Time entries must have duration, project, developer, and date" do
    project = Project.create!(name: "Website", allowed_hours: 10)
    time1 = TimeEntry.create!(duration: 2, developer_id: 1, project_id: 1, date: Date.new)
    time2 = TimeEntry.new()
    assert "Website", time1.developer_id
    refute time2.save
  end
end
