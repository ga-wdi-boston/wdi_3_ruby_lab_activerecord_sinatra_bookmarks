class CreatePosts < ActiveRecord::Migration
	def up
	  	create_table :comments do |t|
	  	t.text :author
	  	t.text :body
	end
  end

  def down
  	drop_table :comments
  end 
end
