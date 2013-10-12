class CreateShorts < ActiveRecord::Migration

  def up
  	create_table :shorts do |t|
  		t.string :url
  		t.string :original
  		t.timestamps
  	end
  end

  def down
  	drop_table :shorts
  end
end
