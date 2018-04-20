class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :image, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :retweet_id
      t.integer :reply_id
      t.timestamps null: false
    end
  end
end
