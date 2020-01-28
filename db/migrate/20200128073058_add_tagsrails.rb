class AddTagsrails < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :content, :tag
  end
end
