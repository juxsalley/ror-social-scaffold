class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :sent_friend_request, class_name: :Friendship, foreign_key: :sender_id, inverse_of: :sender

  has_many :friend_request, class_name: :Friendship, foreign_key: :receiver_id, inverse_of: :receiver
  has_many :friends, -> { merge(Friendship.friends) }, through: :friend_request, source: :receiver

  has_many :received_requests, -> { merge(Friendship.not_friends) }, through: :friend_request, source: :sender
  has_many :unconfirmed_requests, lambda {
                                    merge(Friendship.not_friends)
                                  }, through: :sent_friend_request, source: :receiver
end
