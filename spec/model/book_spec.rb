require 'rails_helper'

describe Book do
  describe '#create' do
    it "全項目（title、content、外部idのuser_id）が存在すれば登録できること" do
      user = build(:user)
      book = user.books.build(title: "aiueo", content: "aiueo", user_id: 1)
      expect(book).to be_valid
    end
  end
end