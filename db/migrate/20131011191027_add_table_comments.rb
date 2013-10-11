class AddTableComments < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
      t.text :author
      t.text :body
      t.timestamps
  	end
  end

  def down
  end
end
