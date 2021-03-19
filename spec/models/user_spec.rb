require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }

    it {
      should have_many(:sent_friend_request).class_name(:Friendship).with_foreign_key(:sender_id).inverse_of(:sender)
    }
    it {
      should have_many(:friend_request).class_name(:Friendship).with_foreign_key(:receiver_id).inverse_of(:receiver)
    }

    it { should have_many(:friends) }
    it { should have_many(:received_requests) }
    it { should have_many(:unconfirmed_requests) }
  end
end
