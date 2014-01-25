class CreateComments < ActiveRecord::Migration
  def up
  	create_table :comments do |c|
  		c.string :author
  		c.text :body
  		c.timestamps
  	end
  end

  def down
  	drop_table :comments
  end
end
