require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Modelのテスト' do
    let(:user) { create(:user) }

    context 'バリテーションのテスト' do
      it 'email, passwordがあれば有効であること' do
        expect(user).to be_valid
      end
      it 'emailがなければ無効であること' do
        user.email = nil
        expect(user.valid?).to eq(false)
      end
      it 'passwordがなければ無効であること' do
        user.password = nil
        expect(user.valid?).to eq(false)
      end
    end
  end
end
