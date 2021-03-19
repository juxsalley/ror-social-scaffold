require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'Validates' do
    it { should validate_presence_of(:content) }
  end
end
