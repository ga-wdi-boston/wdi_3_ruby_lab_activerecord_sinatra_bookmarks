class AddDiscussionsToLinks < ActiveRecord::Migration
  def up
    add_column :discussions, :link_id, :integer
  end

  def down
    remove_column :comments, :link_id
  end
end
