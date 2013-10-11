class CreateShortlinks < ActiveRecord::Migration
  	def up
	  	create_table :links do |t|
	  	t.text :url
	  	t.text :short_url
		t.timestamp :created_at
	end
  end

  def down
  	drop_table :links
  end
end
