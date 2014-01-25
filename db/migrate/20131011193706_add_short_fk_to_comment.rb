class AddShortFkToComment < ActiveRecord::Migration
  def up
  	add_column :comments, :short_id, :integer
  end

  def down
  	remove_column :comments, :short_id, :integer
  end
end
