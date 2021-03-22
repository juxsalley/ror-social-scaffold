class Friendship < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: :sender_id
  belongs_to :receiver, class_name: :User, foreign_key: :receiver_id

  scope :friends, -> { where(confirmed: true) }
  scope :not_friends, -> { where(confirmed: false) }
  # Ex:- scope :active, -> {where(:active => true)}

  def confirm_friend
    update_attributes(confirmed: true)
    Friendship.create!(friend_id: user_id,
                       user_id: friend_id,
                       confirmed: true)
  end
end
