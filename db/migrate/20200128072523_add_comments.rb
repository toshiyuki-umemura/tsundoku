class AddComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :content, :text, null: false
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :book, null: false, foreign_key: true
  end
end
