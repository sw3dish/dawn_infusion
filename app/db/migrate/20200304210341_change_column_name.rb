class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :stories, :text, :html
  end
end
