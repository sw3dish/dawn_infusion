class AddLyraId < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :lyra_id, :string
    add_column :newsletters, :lyra_id, :string
  end
end
