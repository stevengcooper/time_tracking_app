class RemoveDateFromTimeEntries < ActiveRecord::Migration
  def change
    remove_column :time_entries, :date, :date
  end
end
