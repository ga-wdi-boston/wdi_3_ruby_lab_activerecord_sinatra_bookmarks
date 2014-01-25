class AddCommentsTable < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
	t.string :author
	t.string :body
	t.integer :link_id
	t.timestamps
	end
  end

  def down
  	drop_table :comments
  end
end
