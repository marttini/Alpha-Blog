class EditTimestampNamesFromArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :create_at, :created_at
    rename_column :articles, :update_at, :updated_at
  end
end
