class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :allowed_hours

      t.timestamps null: false
    end
  end
end
