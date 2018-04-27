class Image < ActiveRecord::Base
  belongs_to :tweet
  mount_uploader :content, ImageUploader
end
