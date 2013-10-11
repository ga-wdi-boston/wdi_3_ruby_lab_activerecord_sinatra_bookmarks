class AddLinkFkColumnToComments < ActiveRecord::Migration
  def up
  	add_column :comments, :link_id, :integer
  end

  def down
  	remove_column :comments, :link_id
  end
end
