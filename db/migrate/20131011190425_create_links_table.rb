class CreateLinksTable < ActiveRecord::Migration
  def up
  	create_table :links do |t|
	t.string :original
	t.string :short
	end
  end

  def down
  	drop_table :links
  end
end
