class AddTagToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :tag, :string
  end
end
