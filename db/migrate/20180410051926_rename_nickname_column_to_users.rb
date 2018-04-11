class RenameNicknameColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :nickname, :screen_name
  end
end
