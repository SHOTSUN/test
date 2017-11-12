class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, null: false, default: "local"
    add_column :users, :uid, :string
  end
end
