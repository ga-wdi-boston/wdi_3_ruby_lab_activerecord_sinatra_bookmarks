class CreateLinks < ActiveRecord::Migration
  def up
  	create_table :links do |l|
  		l.string :long_url
  		l.string :short_url
  		l.timestamps
  	end
  end

  def down
  	drop_table :links
  end
end
