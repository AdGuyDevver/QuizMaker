class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :users, :is_admin?, :is_admin
    rename_column :users, :is_super_admin?, :is_super_admin
  end
end
