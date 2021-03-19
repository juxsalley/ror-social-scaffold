require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Associations' do
    it { should belong_to(:sender).class_name(:User).with_foreign_key(:sender_id) }
    it { should belong_to(:receiver).class_name(:User).with_foreign_key(:receiver_id) }
  end
end
