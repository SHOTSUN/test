class AddAnotherColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ban, :boolean, default: false
    change_column :users, :provider, "local"
  end
end
