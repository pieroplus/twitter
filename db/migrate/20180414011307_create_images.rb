class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :content
      t.references :tweet
      t.timestamps null: false
    end
  end
end
