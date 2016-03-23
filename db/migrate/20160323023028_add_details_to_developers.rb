class AddDetailsToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :first_name, :string
    add_column :developers, :last_name, :string
  end
end
