require 'rails_helper'

describe Book do
  describe '#create' do
    it "全項目（title、content、外部idのuser_id）が存在すれば登録できること" do
      user = build(:user)
      book = user.books.build(title: "aiueo", content: "aiueo", user_id: 1)
      expect(book).to be_valid
    end

    it "titleが空では登録できないこと" do
      book = build(:book, title: nil)
      book.valid?
      expect(book.errors[:title]).to include("を入力してください")
    end

    it "contentが空では登録できないこと" do
      book = build(:book, content: nil)
      book.valid?
      expect(book.errors[:content]).to include("を入力してください")
    end
  end
end