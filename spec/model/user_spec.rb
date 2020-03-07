require 'rails_helper'

describe User do
  describe '#create' do
    it "全項目（name、nickname、email、password、password_confirmation）が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end