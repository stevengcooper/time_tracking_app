class RemoveNameFromDevelopers < ActiveRecord::Migration
  def change
    remove_column :developers, :name, :string
  end
end
