class AddBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :string, null: false
    add_column :books, :content, :text,  null: false
    add_reference :books, :user, null: false, foreign_key: true
  end
end
