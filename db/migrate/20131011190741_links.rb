class Links < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.string :originalurl
      t.string :shorturl
      t.timestamps
    end
  end


  def down
    drop_table :link
  end
end
