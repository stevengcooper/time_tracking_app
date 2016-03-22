class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :duration
      t.date :date
      t.integer :developer_id
      t.integer :project_id

      t.timestamps null: false
    end
    add_index :time_entries, :developer_id
    add_index :time_entries, :project_id
  end
end
