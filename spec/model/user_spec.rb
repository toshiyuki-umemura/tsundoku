require 'rails_helper'

describe User do
  describe '#create' do
    it "全項目（name、nickname、email、password、password_confirmation）が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空では登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
    
  end
end