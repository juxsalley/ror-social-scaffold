class Friendship < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: :sender_id
  belongs_to :receiver, class_name: :User, foreign_key: :receiver_id

  scope :friends, -> { where(confirmed: true) }
  scope :not_friends, -> { where(confirmed: false) }
  # Ex:- scope :active, -> {where(:active => true)}
end
