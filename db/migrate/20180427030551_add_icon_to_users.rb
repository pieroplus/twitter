class AddIconToUsers < ActiveRecord::Migration
  def change
    add_column :users, :icon_image, :string
    add_column :users, :header_image, :string
  end
end
