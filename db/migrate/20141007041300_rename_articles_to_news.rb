class RenameArticlesToNews < ActiveRecord::Migration
  def change
	rename_table :articles, :news
  end
end
