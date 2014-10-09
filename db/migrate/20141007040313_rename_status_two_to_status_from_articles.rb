class RenameStatusTwoToStatusFromArticles < ActiveRecord::Migration
  def change
	rename_column :articles, :status_two, :status
  end
end
