require 'rails_helper'

describe Book do
  describe '#create' do

    let(:user) { create(:user) }

    it "tagが存在すれば登録できること" do
      book = user.books.build(title: "aiueo", content: "aiueo", user_id: 1)
      tag = book.tags.build(tag: "aiueo", book_id: 1)
      expect(tag).to be_valid
    end
  end
end