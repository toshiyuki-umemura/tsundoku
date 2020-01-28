class AddTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :content, :string, null: false
    add_reference :tags, :book, null: false, foreign_key: true
  end
end
