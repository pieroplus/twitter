class AddscreenNameTousers < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :text
  end
end
