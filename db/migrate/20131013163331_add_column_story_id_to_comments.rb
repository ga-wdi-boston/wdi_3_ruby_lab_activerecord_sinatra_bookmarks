class AddColumnStoryIdToComments < ActiveRecord::Migration
  def up
    add_column :urls, :url_id, :integer
  end

  def down
    remove_column :urls, :url_id, :integer
  end
end
