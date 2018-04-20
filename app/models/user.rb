class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets

  validates :name, presence: true, length: { maximum: 50 }
  validates :screen_name, presence: true, length: { maximum: 50 }

  acts_as_followable
  acts_as_follower
end
