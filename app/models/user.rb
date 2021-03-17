class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  has_many :friendships 
  has_many :inverse_friendships, class_name: 'friendship', foreign_key: :user_id
  
  has_many :inverse_friends, through: :inverse_friendships
  
  has_many :confirmed_friendships, -> { where status: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  has_many :unconfirmed_friendships, -> { where status: false }, class_name: 'Friendship'

  has_many :received_friendrequests, -> { where status: false }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :friend_requests, through: :received_friendrequests, source: :user

  has_many :pending_friendrequests, -> { where status: false }, class_name: 'Friendship', foreign_key: :user_id
  has_many :pending_requests, through: :pending_friendrequests, source: :friend

  def friend?(user)
    friends.include?(user)
  end

  
end
