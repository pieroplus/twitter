== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database creation

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, add_index|
|screen_name|text|null: false, unique: true, add_index|
|email|text|null: false, unique: true|
|introduction|text||
|address|text||
|url|text||
|birthday|text||
|icon_img|string||
|header_img|string|||


### Association
- has_many :tweets
- has_many :favotrites
- has_many :messages
- has_many :active_relationships, class_name:"Relationship"

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|foreign_key: true|
|image_id|integer|foreign_key: true|
|retweet_id|integer||
|reply_id|integer|||


### Association
- belongs_to :user
- has_many :images

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: true|
|content|string|null: false|

### Association
- belongs_to :tweet

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false, foreign_key: true|
|followed_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followeed, class_name: "User"

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|

### Association
- has_many :members
- belongs_to :messages

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
