class AddColumnUsers < ActiveRecord::Migration
  def up
    add_column :users, :introduction, :text
    add_column :users, :address, :text
    add_column :users, :user_url, :text
    add_column :users, :birthday, :text
    add_column :users, :icon_img, :string
    add_column :users, :header_img, :string
  end
end
