require 'rails_helper'

describe Book do
  describe '#create' do

    let(:user) { create(:user) }

    it "全項目（title、content、外部idのuser_id）が存在すれば登録できること" do
      book = user.books.build(title: "aiueo", content: "aiueo")
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

    it "titleが30文字を超えると登録できないこと" do
      title = 'a' * 31
      book = build(:book, title: title)
      book.valid?
      expect(book.errors[:title]).to include("は30文字以内で入力してください")
    end

    it "titleが30文字以下では登録できること" do
      title = 'a' * 30
      book = user.books.build(title: title, content: "aiueo")
      expect(book).to be_valid
    end

    it "contentが250文字を超えると登録できないこと" do
      content = 'a' * 251
      book = build(:book, content: content)
      book.valid?
      expect(book.errors[:content]).to include("は250文字以内で入力してください")
    end

    it "contentが250文字以下では登録できること" do
      title = 'a' * 250
      book = user.books.build(title: "aiueo", content: title)
      expect(book).to be_valid
    end
  end
end