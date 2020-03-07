require 'rails_helper'

describe Book do
  describe '#create' do

    let(:user) { create(:user) }

    it "tagが存在すれば登録できること" do
      book = user.books.build(title: "aiueo", content: "aiueo", user_id: 1)
      tag = book.tags.build(tag: "aiueo", book_id: 1)
      expect(tag).to be_valid
    end

    it "tagがなければ登録できないこと" do
      tag = build(:tag, tag: "", book_id: 1)
      tag.valid?
      expect(tag.errors[:tag]).to include("を入力してください")
    end

    it "tagが10文字以下であれば登録できること" do
      tag_count = 'a' * 10
      book = user.books.build(title: "aiueo", content: "aiueo", user_id: 1)
      tag = book.tags.build(tag: tag_count, book_id: 1)
      expect(tag).to be_valid
    end

    it "tagが10文字を超えると登録できないこと" do
      tag_count = 'a' * 11
      tag = build(:tag, tag: tag_count, book_id: 1)
      tag.valid?
      expect(tag.errors[:tag]).to include("は10文字以内で入力してください")
    end
  end
end